###############################################################################
##  $FileName: Test-WinLog.ps1
##  $Version: 1.0
##  $Description:
###############################################################################
##  $Author: Nicolas Delorme
##  $CreationDate:
##  $LastModifiedDate:
###############################################################################

function Test-WinLog() {
  param (
    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$true,
      Position=0)]
		[String]$LogName = $WinLogName
  )
	
  if (!($LogName)) { return $false }

  try { $res = (Get-EventLog -list | select-object Log).log.contains($LogName) }
  catch { return $false }
	
	if ($res) { return $true } 
	return $false

} # function Test-WinLog
