function Set-TargetResource {
	param (
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $InstanceName, # e.g. 'Tentacle'
		
		[Parameter(Mandatory)]
        [string] $ServicePath, # e.g. 'C:\Octopus'
		
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
	
	function Re-register {
		Unregister
		Register
	}
	
	function Get-Current{
		$current = (Get-TargetResource -InstanceName $InstanceName -ServicePath $ServicePath)
		$instance = $current.Instance
		$settings = $current.Settings
		
		if (!($settings) -or !($instance)) { 
			Write-Verbose "No tentacle detected!"
			return $current
		}
		Write-Verbose "Tentacle detected!"
		return $current, $instance, $settings
	}
		
	$current, $instance, $settings = Get-Current
	Write-Verbose "Configuring $InstanceName"
	
	# # Ensure Absent
	# #--------------------------------------------------------------------------
	if ($Ensure -eq 'Absent' -and $current['Ensure'] -ne 'Absent' ) {
		Write-Verbose "Ensure instance $InstanceName is 'Absent'. Ignoring all other parameters."
		Unregister
	}
	
	# Ensure Present
	#--------------------------------------------------------------------------
	
	# Test Application
	if ( !(Get-WindowsApplication | ? Name -eq $ApplicationName)) {
		Write-Verbose "Agent $ApplicationName not installed. Unable to apply desired configuration."
		return
	}
	
	Write-Verbose "Agent $ApplicationName installed."
	
	# If no instance or settings, register Tentacle
	if ( !($instance) -or !($settings)) { 
		Write-Verbose "No tentacle located. Registering."
		Register
		$current, $instance, $settings = Get-Current
	}
	
	# If settings incorrect, re-register Tentacle
	if ( $settings['ApplicationDirectory'] -ne $ApplicationDirectory -or 
									$settings['PortNumber'] -ne $PortNumber) {
		Write-Verbose "Incorrect ApplicationDirectory| Desired: $ApplicationDirectory, Current: $($settings['ApplicationDirectory'])"
		Write-Verbose "Incorrect Port| Desired: $PortNumber, Current: $($settings['PortNumber'])"
		Re-register
		$current, $instance, $settings = Get-Current
	}
	
	# Get Service
	$serviceName = Get-ServiceName $InstanceName
	$service = Get-Service $serviceName
	
	# Configure Instance State
	if ($instance['State'] -ne $State) {
		Write-Verbose "Service $serviceName state is $($instance['State'])"
		switch ($State) { 
			'Stopped' {
				Write-Verbose "Stopping service $serviceName ..."
				Stop-Service $service
			}
			'Started' {
				if ($instance['State'] -eq 'Stopped') {
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
	if ($instance['StartMode'] -ne $StartMode) {
		Write-Verbose "Setting service $serviceName start mode to '$StartMode'"
		Set-Service $service -startuptype $StartMode
	}
	
	#---------------------------------------
    Write-Verbose "$InstanceName configured."
}


