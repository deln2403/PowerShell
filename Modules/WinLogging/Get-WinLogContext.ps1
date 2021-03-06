###############################################################################
##  $FileName: Get-WinLogContext.ps1
##  $Version: 1.0
##  $Description:
###############################################################################
##  $Author: Nicolas Delorme
##  $CreationDate:
##  $LastModifiedDate:
###############################################################################

<#
.Synopsis
  Prints to screen variable names and values
.DESCRIPTION
  Prints to screen the names and values of the 'Win' variables. The
  functions prints  all variables beginning with 'Win'.
.EXAMPLE
  Get-WinLogContext
#>
function Get-WinLogContext {
  get-variable | ? {$_.name -like "WinLog*"}
}
