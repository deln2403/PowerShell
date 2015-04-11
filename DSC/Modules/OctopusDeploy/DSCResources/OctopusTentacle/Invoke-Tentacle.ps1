function Invoke-Tentacle {
    param (
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        $Arguments
	) 
	
	Write-Verbose '#-------------------- Invoke-Tentacle --------------------'
	Write-Verbose "$Tentacle $([string]$Arguments)"
		
	try { Invoke-Command -ScriptBlock {& "$DefaultInstallPath\$Tentacle" $Arguments | Write-Verbose } }
	catch { throw "Exit code $LASTEXITCODE with error: $e" }
	
    if ($LASTEXITCODE -ne 0 -and $LASTEXITCODE -ne $null) {
        throw "Exit code $LASTEXITCODE"
    }
}
 
