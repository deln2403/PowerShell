function Register-Tentacle {
   param (  
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $InstanceName, # e.g. 'Tentacle'
		
		[Parameter(Mandatory)]
		[ValidateScript({Test-Path $_})]
        [string] $ServicePath, # e.g. 'C:\Octopus'
		
		[Parameter(Mandatory)][string] $ApiKey,
		[Parameter(Mandatory)][string] $OctopusServerUrl,
		[Parameter(Mandatory)][string] $IpAddress,
        [Parameter(Mandatory)][string[]] $Environments,
        [Parameter(Mandatory)][string[]] $Roles,
				
		[Parameter(Mandatory=$false)]
        [string] $ApplicationDirectory = "$ServicePath\Applications",
		
		[Parameter(Mandatory=$false)]
		[ValidateRange(1, 65535)]
        [int] $PortNumber = 10933
    )
 
  <# Should be done by DSC, not netsh
    Write-Verbose "Open port $PortNumber on Windows Firewall"
    Invoke-AndAssert { & netsh.exe advfirewall firewall add rule protocol=TCP dir=in localport=$PortNumber action=allow name="Octopus Tentacle: $InstanceName" }
  #>
 
	# Test Application
	if ( !(Get-WindowsApplication | ? Name -eq $ApplicationName)) {
		throw "Agent $ApplicationName not installed. Unable apply desired configuration."
	}
 
	# http://docs.octopusdeploy.com/display/OD/Automating+Tentacle+installation
	
	# Create Instance
    Invoke-Tentacle -Arguments @(
		'create-instance',
		'--instance', "$InstanceName",
		'--config', "$ServicePath\$InstanceName\Tentacle.config",
		'--console'
	)
	
	# New Certificate
	Invoke-Tentacle -Arguments @(
		'new-certificate',
		'--instance', "$InstanceName",
		'--console'
	)
	
	# Configure service path
    Invoke-Tentacle -Arguments @(
		'configure',
		'--instance', $InstanceName, 
		'--home', $ServicePath,
		'--console'
	)
	
	# Configure ApplicationDirectory
    Invoke-Tentacle -Arguments @(
		'configure',
		'--instance', $InstanceName,
		'--app', $ApplicationDirectory,
		'--console'
	)
	
	# Configure Port
    Invoke-Tentacle -Arguments @(
		'configure',
		'--instance', $InstanceName,
		'--port', $PortNumber,
		'--console'
	)
		
	# Register with server
	$arguments = @(
		'register-with',
		'--instance', $InstanceName,
		'--server', $OctopusServerUrl,
		'--name', $env:COMPUTERNAME,
		'--publicHostName', $IpAddress,
		'--apiKey', $apiKey,
		'--comms-style', 'TentaclePassive',
		'--force', '--console'
	)
    foreach ($environment in $Environments) { $arguments += @('--environment', $environment) }
    foreach ($role in $Roles) { $arguments += @('--role', $role) }
	Invoke-Tentacle -Arguments $arguments
	
	# Install service
    Invoke-Tentacle -Arguments @(
		'service',
		'--install',
		'--instance', $InstanceName,
		'--console'
	)
	
	

}
