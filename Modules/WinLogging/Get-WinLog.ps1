###############################################################################
##  $FileName: Get-WinLog.ps1
##  $Version: 1.0
##  $Description:
###############################################################################
##  $Author: Nicolas Delorme
##  $CreationDate:
##  $LastModifiedDate:
###############################################################################

<#
.Synopsis
  Returns values from a Custom Event Log with specified log name and source.
.DESCRIPTION
  Rerturns the values from a Windows Event Log with the specified log name and source. The function
  first checks if a logfile with the specified log name exists and creates it if not.
  The log file name and source can be specified as parameters or can be set globally with 
  the $WinLogName and $WinLogSource variables.

  The function returns the messages in the specified Windows Event log.
.PARAMETER LogName 
  Specifies the name of the log file to get and/or create. If the parameter is not specified
  the $WinLogName variable will be used. If the global variable is null or does not
  exist the function will throw an error
.LINK
  Get-WinLog
#>
function Get-WinLog() {
  [CmdletBinding()]
  param (
    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$true,
      Position=0)][int]$Count = 20,
  
    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=1)][String]$LogName = $WinLogName,

    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=2)][String]$Source,
      
    [switch]$All
  )
	   
  $log = Test-WinLogSource -LogName $LogName -Source $Source `
     -ErrorAction "SilentlyContinue"
  New-WinLog -LogName $LogName -Source $Source
	
	$cmd = "Get-EventLog -LogName $LogName"
	if ($Source) {$cmd += " -Source $Source"}
	
  if ($PSBoundParameters['All']) { 
    return (Invoke-Expression -Command $cmd)
  }
	
	$cmd += " | Select -first $Count"
	return (Invoke-Expression -Command $cmd)
	
} # function Get-WinLog




