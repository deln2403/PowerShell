###############################################################################
##  $FileName: New-WinLog.ps1
##  $Version: 1.0
##  $Description:
###############################################################################
##  $Author: Nicolas Delorme
##  $CreationDate:
##  $LastModifiedDate:
###############################################################################

<#
.Synopsis
  Creates a Windows Event Log with specified log name and source.
.DESCRIPTION
  Creates a Windows Event Log with the specified log name and source. The function
  first checks if a logfile with the specified log name exists and creates it if not.
  The log file name and source can be specified as parameters or can be set globally with 
  the $WinLogName and $WinLogSource variables.

  The function returns the messages in the specified Windows Event log.
.PARAMETER LogName 
  Specifies the name of the log file to get and/or create. If the parameter is not specified
  the $WinLogName variable will be used. If the global variable is null or does not
  exist the function will throw an error
.LINK
  New-WinLog
#>
function New-WinLog() {
  [CmdletBinding()]
  param (
    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=0)][String]$LogName = $WinLogName,

    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=1)][String]$Source = $WinLogSource
  )
  
	if (!$LogName -or !$Source) { 
		throw 'Event log Name and Source required. Perhaps set $WinLogName and $WinSource variables.' }
	
	if (Test-WinLogSource -LogName $LogName -Source $Source) { return }	
	
	Remove-EventLog -Source $Source -ErrorAction 'SilentlyContinue'
	try {
		New-EventLog -LogName $LogName -Source $Source
		Write-EventLog -LogName $LogName `
									 -Source $Source `
									 -EntryType 'Information' `
									 -EventID 1 `
									 -Message "Initialize new $LogName event log for source $Source"
	}
	catch {
		throw "Unable initialize source $Source" 
	}
		
} # function New-WinLog