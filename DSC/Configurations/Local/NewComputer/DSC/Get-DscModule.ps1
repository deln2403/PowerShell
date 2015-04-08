#------------------------------------------------------------------------------
# WARNING
# The account password to join the domain will be stored in plain text.
# Don't forget to Remove-ConfigurationFileup.
#------------------------------------------------------------------------------

function Get-DscModule {
  [Cmdletbinding()]
  param (
		[parameter(
      Mandatory=$true,
      ValueFromPipeline=$false,
      Position=0)]
		[ValidateNotNullOrEmpty()]
		$SourcePath,
		
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=1)]
		[ValidateNotNullOrEmpty()]
		[pscredential] $Credential = $(Get-Credential),
		
		[switch] $Prompt,
		[switch] $Clean,
		
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=4)]
		$WorkingDirectory = '.\MOF'
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
		
		try { Get-Item -Path "$PSScriptRoot\Configurations\PsModules.ps1"  | Foreach-Object{ . $_.FullName } }
		catch { throw 'Error loading Configurations' }

		# Elevated Shell
		if ((Test-ElevatedShell) -ne $true) {throw 'Run as admin.'}
		
	}

	process {
		# Get PS and DSC Modules (custom resources)
		$path = Join-Path $WorkingDirectory '\SetPsModules'
		PsModules -OutputPath $path  -ConfigurationData $configData -Source $SourcePath -Credential $Credential
		Start-DscConfiguration -Path $path -Verbose -Wait -Force
		if ($Prompt) { Request-Confirmation }
		if ($Clean) { Remove-Item $path -Recurse -Force }
		
	}
	
	end {
	
	}
	
}

