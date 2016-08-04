
<#
.SYNOPSIS

.DESCRIPTION

.EXAMPLE
#>
function Get-SystemDns { 

	$plaintext = Invoke-command -ScriptBlock { ipconfig '/displaydns'}
	
	
} 



Set-Alias -Name Get-Dns -Value Get-SystemDns

