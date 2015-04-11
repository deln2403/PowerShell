function Get-TargetResource {
    [OutputType([Hashtable])]
    param (
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $InstanceName, # e.g. 'Tentacle'
		
		[Parameter(Mandatory)]
		[ValidateScript({Test-Path $_})]
        [string] $ServicePath # e.g. 'C:\Octopus'
    )
	
	function Absent {
		return @{
			InstanceName = $InstanceName
			Ensure = 'Absent'
		}
	}
	
	# Application
	if ( !(Get-WindowsApplication | ? Name -eq $ApplicationName)) {
		Write-Verbose "Application $ApplicationName not installed. Unable to get service (tentacle) instance."
		return Absent
	}
	
	# Service Instance
	$serviceName = Get-ServiceName $InstanceName
	Write-Verbose "Searching for service '$serviceName' ..."
	$service = Get-WmiObject win32_service | ? Name -eq $serviceName
	
	if (!($service)) {
		Write-Verbose "Unable to locate service $serviceName."
		return @{
			InstanceName = $InstanceName
			Ensure = 'Absent'
		}
	}	
	Write-Verbose "Service '$serviceName' found."

	# Service State/Status
    Write-Verbose "Checking service status: $serviceName"
	
	$instance = @{
		'State' = $service.State
		'Status' = $service.Status
		'StartMode' = $service.StartMode
		'ExitCode' = $service.ExitCode
	}
	Write-Verbose "Service (tentacle) is $($instance['State'])"

	# Test Tentacle config file
	$configPath = "$ServicePath\$InstanceName\Tentacle.config"
	Write-Verbose $configPath
	if (!(Test-Path $configPath)) { 
		throw "Unable to locate $configPath"
	}
	
	# Get Tentacle parameters
	$configContent = ([xml] (Get-Content $configPath)).'octopus-settings'.set
	if ( $configContent.count -eq 0 ) { throw "Unable to retrieve settings from $configPath" }
	
	$settings = @{
		'PortNumber' = ( $configContent | ? Key -eq 'Tentacle.Services.PortNumber').'#text'
		'ApplicationDirectory' = ( $configContent | ? Key -eq 'Tentacle.Deployment.ApplicationDirectory').'#text'
	}
	
    return @{
        InstanceName = $InstanceName
        Ensure = 'Present'
        Instance = $instance
		Settings = $settings
    };
}
