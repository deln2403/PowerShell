function Test-TargetResource {
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
 
    $current = (Get-TargetResource -InstanceName $instanceName -ServicePath $ServicePath)

	# Ensure
    $pass = $current['Ensure'] -eq $Ensure
    Write-Verbose "Ensure | Desired:$Ensure, Current:$($current['Ensure']), Pass:$pass"
    if (!$pass) { return $false }
    
	# State
	$pass = $current['State'] -eq $State
	Write-Verbose "State | Desired:$State, Current:$($current['State']), Pass:$pass"
	if (!$pass) { return $false }
	
	# StartMode
	$pass = $current['StartMode'] -eq $StartMode
	Write-Verbose "StartMode | Desired:$StartMode, Current:$($current['StartMode']), Pass:$pass"
	if (!$pass) { return $false }

	# PortNumber
	$pass = $current['PortNumber'] -eq $PortNumber
	Write-Verbose "PortNumber | Desired:$PortNumber, Current:$($current['PortNumber']), Pass:$pass"
	if (!$pass) { return $false }

	# ApplicationDirectory
	$pass = $current['ApplicationDirectory'] -eq $ApplicationDirectory
	Write-Verbose "ApplicationDirectory | Desired:$ApplicationDirectory, Current:$($current['ApplicationDirectory']), Pass:$pass"
	if (!$pass) { return $false }
	
	
    return $true
}
