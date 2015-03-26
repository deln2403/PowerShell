###############################################################################
##  $FileName: Write-WinLog.ps1
##  $Version: 1.0
##  $Description:
###############################################################################
##  $Author: Nicolas Delorme
##  $CreationDate:
##  $LastModifiedDate:
###############################################################################

<#
.Synopsis
  Proxy function for Write-Host with the added funcitonality of writting to the Windowd event log.
  Optionally, also directs the error output to a log file.
.DESCRIPTION
  Proxy function for Write-Host with the added funcitonality of writting to the Windowd event log.
  Optionally, also directs the error output to a log file. This function is a wrapper of the Logging
  Module (http://gallery.technet.microsoft.com/scriptcenter/Write-timestamped-output-4ff1565f) with 
  the added functionality of writting a Windows event. The function will use the globally set 
  $WinLogName and $WinLogSource unless the LogName and Source parameters are 
  respectively specified.

  The function will throw an error if the specified LogName and Source are not found. Please be sure
  to call Get-EventLogEvent at least once before calling this function.
.PARAMETER $Message
  Is the value to be written to the log.
.PARAMETER LogFile
  Specifies the full path to the log file.  If this value is not specified, it will default to
  the variable $LogFilePreference, which is provided for the user's convenience in redirecting
  output from all of the Write-*Log functions to the same file.
.PARAMETER $LogName
  Name of the Windows Event Log to which to write the event. Defaults to $WinLogName
.PARAMETER $Source
  The Windows Event source to which to associate the event. Defaults to $WinLogSource
.LINK
  Write-HostWinLog
.EXAMPLE
  $WinLogName = "MyNewLog"
  $WinLogSource = "General" 
  Write-Host "This event will be published to the console and to the MyNewLog Windows event log"
.EXAMPLE
  $WinLogName = "MyNewLog"
  $WinLogSource = "General"
  $LogFilePreference = "C:\test.log"
  Write-Host "This event will be published to the console, to the MyNewLog Windows event log and to C:\test.log"
#>
function Write-WinLog {
  [Cmdletbinding()]
  param (
		[parameter(
      Mandatory=$true,
      ValueFromPipeline=$true,
      Position=0)]
		[ValidateNotNullOrEmpty()]
		[Alias('Msg')]
		[String]$Message,
			
    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$false)]
		[ValidateSet('Information','Warning','Error')]
		[String]$EntryType = 'Information',
      
    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$false)]
		[int]$EventId = 1, 
    
    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$false)]
		[int]$Category = 10,
      
    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$false)]
		[String]$LogName = $WinLogName,

    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=6)]
		[String]$Source = $WinLogSource,
      
    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$false)]
		[Alias('Log')]
		[String]$LogFile
  )
	
	$Message = $Message.replace("'",'"')
  
  switch ($EntryType) { 
		'Warning' { $cmd = "Write-WarningLog -Message "} 
		'Error' { $cmd = "Write-ErrorLog -Message "}
		default { $cmd = "Write-HostLog -Object "}
  }
	if ($LogFile) { $cmd += " -LogFile $LogFile" }
	Invoke-Expression "$cmd '$Message'"

	New-WinLog -LogName $LogName -Source $Source
	Write-EventLog -LogName $LogName `
								 -Source $Source `
								 -EntryType $EntryType `
								 -EventId $EventId `
								 -Category $Category `
								 -Message $Message
	
} # function Write-HostWinLog











