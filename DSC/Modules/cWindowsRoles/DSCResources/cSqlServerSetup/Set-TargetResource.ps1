function Set-TargetResource {

    param ( 
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string] $Name,
		
        [ValidateSet('Present', 'Absent')]
        [string]$Ensure = 'Present',
		
		[Parameter(Mandatory)]
		[ValidateScript({Test-Path $_})]
		[string] $SetupLocation,
		
		[Parameter(Mandatory)]
		[ValidateScript({Test-Path $_})]
		[string] $ConfigPath
    )
	
	Write-Verbose "Set-TargetResource"
	Write-Verbose "SetupLocation $SetupLocation"
	Write-Verbose "ConfigPath $ConfigPath"

    $current = Get-TargetResource -Name $Name -SetupLocation $SetupLocation -ConfigPath $ConfigPath
	
	if ($Ensure -eq 'Present' -and $current['Ensure'] -eq 'Absent') {
		
		Write-Verbose 'SQL Install logs - %programfiles%\Microsoft SQL Server\120\Setup Bootstrap\Log\'

		$installer = "$SetupLocation\Setup.exe"
		$arguments = @(
			"/IACCEPTSQLSERVERLICENSETERMS",
			"/ConfigurationFile=$ConfigPath"
		)
		
		Write-Verbose "$installer $([string]$arguments)"
		
		# Install service	
		try { Invoke-Command -ScriptBlock {& $installer $arguments | Write-Verbose } }
		catch { throw "Exit code $LASTEXITCODE with error: $e" }
		
		if ($LASTEXITCODE -ne 0 -and $LASTEXITCODE -ne $null) {
			throw "Exit code $LASTEXITCODE"
		}
	}
	else {
		Write-Verbose 'This module is only configured to install MSSQL. Skipping uninstall...'
	}
}