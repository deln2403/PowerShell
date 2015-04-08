function Set-DscNetwork {
  [Cmdletbinding()]
  param (
		[parameter(
      Mandatory=$true,
      ValueFromPipeline=$false,
      Position=0)]
		[ValidateNotNullOrEmpty()]
		[string] $IPAddress,
		
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=1)]
		[ValidateNotNullOrEmpty()]
		[string] $DefaultGateway,

		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=2)]
		[ValidateNotNullOrEmpty()]
		[string[]] $DnsAddress,
		
		[switch] $Prompt,
		[switch] $Clean,
		
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=5)]
		$WorkingDirectory = '.\MOF'
	)
	
	begin {
		# Functions and Configurations
		try { Get-ChildItem -Path "$PSScriptRoot\*.ps1" | Foreach-Object{ . $_.FullName } }
		catch { throw 'Error loading Functions' }
		
		try { Get-ChildItem -Path "$PSScriptRoot\Configurations\*.ps1" | Foreach-Object{ . $_.FullName } }
		catch { throw 'Error loading Configurations' }

		# Elevated Shell
		if ((Test-ElevatedShell) -ne $true) {throw 'Run as admin.'}
	}

	process {
		# Configure additional Ethernet settings
		$path = Join-Path $WorkingDirectory '\SetNetworking'
		Networking -OutputPath $path -IPAddress $iPAddress `
					-DefaultGateway $DefaultGateway -DnsAddress $DnsAddress
		Start-DscConfiguration -Path $path -Verbose -Wait -Force
		if ($Prompt) { Request-Confirmation }
		if ($Clean) { Remove-Item $path -Recurse -Force }
	}
	
	end {
	
	}
}

