###############################################################################
##  $FileName: Test-WinLogSource.ps1
##  $Version: 1.0
##  $Description:
###############################################################################
##  $Author: Nicolas Delorme
##  $CreationDate:
##  $LastModifiedDate:
###############################################################################

function Test-WinLogSource {
  param (
    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=0)][String]$LogName = $WinLogName,

    [parameter(
      Mandatory=$false,
      ValueFromPipeline=$true,
      Position=1)][String]$Source = $WinLogSource
  )
	
	if (!($LogName) -or !($Source)) {
		throw "Event log Name and Source required. Perhaps set WinLogName and WinLogSource variables." }
 
  if (!(Test-WinLog -LogName $LogName)) { return $false }

	try {
		$sources = Get-EventLog -LogName $LogName | Select-Object Source -Unique
		if ( ($sources).Source -contains $Source ) { return $true }
	}
	catch { return $false }
		
  return $false
} # function Test-WinLogSource
