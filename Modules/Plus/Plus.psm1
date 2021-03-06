###############################################################################
##  $FileName: Plus.ps1
##  $Version: 0.1
##  $Description: 
###############################################################################
##  $Author: Nicolas Delorme
##  $CreationDate: 2014-06-12
##  $LastModifiedDate: 
###############################################################################

# Error handling
Get-ChildItem -Path $PSScriptRoot\*.ps1 | Foreach-Object{ . $_.FullName }

Set-Alias gdu Get-DiskUsage
Set-Alias touch New-File

Export-ModuleMember -function * -alias *