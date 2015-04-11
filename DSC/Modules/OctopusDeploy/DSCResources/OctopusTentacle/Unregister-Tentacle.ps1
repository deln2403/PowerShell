function Unregister-Tentacle {
    param (  
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $InstanceName, # e.g. 'Tentacle'
		
		[Parameter(Mandatory)]
		[ValidateScript({Test-Path $_})]
        [string] $ServicePath, # e.g. 'C:\Octopus'
		
		[Parameter(Mandatory)][string] $ApiKey,
		[Parameter(Mandatory)][string] $OctopusServerUrl
    )
  
	Write-Verbose "Unregistering Tentacle $InstanceName" 
    Invoke-Tentacle -Arguments @(
		'deregister-from',
		'--instance', $InstanceName,
		'--server', $OctopusServerUrl,
		'--apiKey', $apiKey,
		'--console'
	)
}

