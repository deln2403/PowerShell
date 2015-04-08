#------------------------------------------------------------------------------
# WARNING
# The account password to join the domain will be stored in plain text.
# Don't forget to Remove-ConfigurationFileup.
#------------------------------------------------------------------------------

function Join-DscDomain {
  [Cmdletbinding()]
  param (
		[parameter(
      Mandatory=$true,
      ValueFromPipeline=$false,
      Position=0)]
		[ValidateNotNullOrEmpty()]
		[string] $TimeZone,
		
		[parameter(
      Mandatory=$true,
      ValueFromPipeline=$false,
      Position=1)]
		[ValidateNotNullOrEmpty()]
		[string] $ComputerName,
		
		[parameter(
      Mandatory=$true,
      ValueFromPipeline=$false,
      Position=2)]
		[ValidateNotNullOrEmpty()]
		[string] $DomainDnsName,
		
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=3)]
		[ValidateNotNullOrEmpty()]
		[pscredential] $Credential = $(Get-Credential),
		
		[switch] $Prompt,
		[switch] $Clean,
		
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=6)]
		[string] $WorkingDirectory = '.\MOF'
	)
	
	begin {
		# Constants
		# Allows credential to be saved in plain-text in the the *.mof instance document
		Write-Warning 'The account password to join the domain will be stored in plain text.'
		Write-Warning 'Remove-ConfigurationFileup is automatic'
		$configData = @{
			AllNodes = @(        
				@{     
					NodeName = 'localhost'
					PSDscAllowPlainTextPassword = $true 
				} 
			)  
		}
		
		# Functions and Configurations
		try { Get-ChildItem -Path "$PSScriptRoot\*.ps1" | Foreach-Object{ . $_.FullName } }
		catch { throw 'Error loading Functions' }

		try { Get-ChildItem -Path "$PSScriptRoot\Configurations\*.ps1" | Foreach-Object{ . $_.FullName } }
		catch { throw 'Error loading Configurations' }

		# Elevated Shell
		if ((Test-ElevatedShell) -ne $true) {throw 'Run as admin.'}
	}

	process {
		# Configure timezone
		$path = Join-Path $WorkingDirectory '\SetTimeZone'
		TimeZone -OutputPath $path -SystemTimeZone $TimeZone
		Start-DscConfiguration -Path $path -Wait -Verbose -Force 
		if ($Prompt) { Request-Confirmation }
		if ($Clean) { Remove-Item $path -Recurse -Force }

		# Configure host settings
		$path = Join-Path $WorkingDirectory '\SetComputerDomain'
		Write-Warning 'This step will require a reboot.'
		ComputerDomain -OutputPath $path -ConfigurationData $configData -MachineName $ComputerName -DomainDnsName $DomainDnsName -Credential $Credential
		Start-DscConfiguration -Path $path -Verbose -Wait -Force
		if ($Prompt) { Request-Confirmation }; 
		if ($Clean) { Remove-Item $path -Recurse -Force }
	}
		
	end {
		# Reboot
		if ((Get-DscLocalConfigurationManager).LCMState -eq 'PendingReboot') {
			Write-Warning 'Reboot pending.'
			if ($Prompt) { Request-Confirmation }
			Restart-Computer
		}
	}
}
