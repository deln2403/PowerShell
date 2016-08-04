function New-AdminPowerShell {
	[CmdletBinding()]
	Param(
		[Parameter(Mandatory=$False,Position=1)]
		[string]$Username
	)
	
	if ($Username) {
		$cred = Get-Credential $Username

		if ($cred) {
			$argumentList = @('Start-Process powershell.exe -Verb runAs')
			Start-Process powershell.exe -NoNewWindow -Credential $cred -ArgumentList $argumentList
		}
		return
	}
	else {
		Start-Process PowerShell -Verb runAs
	}
	
}

Set-Alias su New-AdminPowerShell
