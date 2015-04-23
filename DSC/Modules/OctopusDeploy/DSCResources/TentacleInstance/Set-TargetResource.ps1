function Set-TargetResource {
	param (
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $InstanceName, # e.g. 'Tentacle'
		
		[Parameter(Mandatory)]
        [string] $ServicePath, # e.g. 'C:\Octopus'
		
		[Parameter(Mandatory=$false)]
        [string] $ApplicationName = 'Octopus Deploy Tentacle',
		
		[Parameter(Mandatory=$false)]
        [ValidateSet('Present', 'Absent')]
        [string] $Ensure = 'Present',
		
		[Parameter(Mandatory=$false)]
        [ValidateSet('Running', 'Stopped')]
        [string] $State = 'Running',
		
		[Parameter(Mandatory=$false)]
		[ValidateSet('Manual','Auto','Disabled')]
        [string] $StartMode = 'Auto',
		
		[Parameter(Mandatory=$false)]
		[ValidateRange(1, 65535)]
        [int] $PortNumber,
		
		[Parameter(Mandatory=$false)]
        [string] $ApplicationDirectory = "$ServicePath\Applications",
		
		[Parameter(Mandatory=$false)]
		[string] $InstallPath,
		
		[Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
		[string] $IpAddress,
		
		[Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
		[string] $ApiKey,
		
		[Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
		[string] $OctopusServerUrl,
		
		[Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
		[string[]] $Environments,
		
		[Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
		[string[]] $Roles
    )
	
	function Unregister {
		Write-Verbose 'Unregister'
		Unregister-Tentacle -InstanceName $InstanceName `
			-ServicePath $ServicePath `
			-ApiKey $ApiKey `
			-OctopusServerUrl $OctopusServerUrl
	}
	
	function Register {
		Write-Verbose 'Register'
		Register-Tentacle -InstanceName $InstanceName `
			-ServicePath $ServicePath `
			-ApiKey $ApiKey `
			-OctopusServerUrl $OctopusServerUrl `
			-IpAddress $IpAddress `
			-Environments $Environments `
			-Roles $Roles
	}
			
	$current = Get-TargetResource -InstanceName $InstanceName -ServicePath $ServicePath
	Write-Verbose "Configuring $InstanceName"
	
	# Ensure Absent
	#--------------------------------------------------------------------------
	if ($Ensure -eq 'Absent' -and $current['Ensure'] -ne 'Absent' ) {
		Write-Verbose "Ensure instance $InstanceName is 'Absent'. Ignoring all other parameters."
		Unregister
	}
	
	# Ensure Present
	#--------------------------------------------------------------------------
	# If no instance or settings, register Tentacle
	if ( !($current['State']) -or !($current['PortNumber'])) { 
		Write-Verbose "No tentacle located. Registering."
		Register
		$current = Get-TargetResource -InstanceName $InstanceName -ServicePath $ServicePath
	}
	
	# If settings incorrect, re-register Tentacle
	if ( $current['ApplicationDirectory'] -ne $ApplicationDirectory -or 
									$current['PortNumber'] -ne $PortNumber) {
		Write-Verbose "Incorrect ApplicationDirectory| Desired: $ApplicationDirectory, Current: $($current['ApplicationDirectory'])"
		Write-Verbose "Incorrect Port| Desired: $PortNumber, Current: $($current['PortNumber'])"
		Unregister
		Register
		$current = Get-TargetResource -InstanceName $InstanceName -ServicePath $ServicePath
	}
	
	# Get Service
	$serviceName = Get-ServiceName $InstanceName
	$service = Get-Service $serviceName
	
	# Configure Instance State
	if ($current['State'] -ne $State) {
		Write-Verbose "Service $serviceName state is $($current['State'])"
		switch ($State) { 
			'Stopped' {
				Write-Verbose "Stopping service $serviceName ..."
				Stop-Service $service
			}
			'Started' {
				if ($current['State'] -eq 'Stopped') {
					Write-Verbose "Starting service $serviceName ..."
					Stop-Service $service
				}
			}
			default { # 'Running'
				Write-Verbose "Service $serviceName Running."
			}
		}
	}
	
	# Configure Instance StartMode
	if ($current['StartMode'] -ne $StartMode) {
		Write-Verbose "Setting service $serviceName start mode to '$StartMode'"
		Set-Service $service -startuptype $StartMode
	}
	
	#---------------------------------------
    Write-Verbose "$InstanceName configured."
}


