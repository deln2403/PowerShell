###############################################################################
##  $FileName: Get-WinLogVariables.ps1
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
  Get-WinLogVariables
#>
function Get-WinLogVariables {
  get-variable | ? {$_.name -like "WinLog*"}
}