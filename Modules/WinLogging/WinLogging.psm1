###############################################################################
##  $FileName: WinLogging.psm1
##  $Version: 1.0
##  $Description:
###############################################################################
##  $Author: Nicolas Delorme
##  $CreationDate:
##  $LastModifiedDate:
###############################################################################

New-Variable -Name WinLogName 	-Value 'WinLogging' -Scope Global -Force
New-Variable -Name WinLogSource -Value 'Custom' 	-Scope Global -Force

Get-ChildItem -Path $PSScriptRoot\*.ps1 | Foreach-Object{ . $_.FullName }

Export-ModuleMember -Function 'New-WinLog','Get-WinLog','Write-WinLog','Get-WinLogContext','Get-ErrorExceptionDetails'
Export-ModuleMember -Variable 'WinLogName','WinLogSource'
Export-ModuleMember -Alias '*'
