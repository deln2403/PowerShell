###############################################################################
##  $FileName: Remove-Msi.ps1
##  $Version: 0.1
##  $Description: 
##
##  $Author: Nicolas Delorme
##  $CreationDate: 2014-06-12
##  $LastModifiedDate: 
###############################################################################


<#
.SYNOPSIS
    Removes a specified MSI

.DESCRIPTION
    Removes an msi specified by name

.PARAMETER Name
    Name of application to remove

.EXAMPLE
    Remove-Msi Png.Rta.Installer

.EXAMPLE
    Remove-Msi -Name "Png.Rta.Installer"
#>
function Remove-Msi {
    Param(
	    [Parameter(Mandatory=$true, Position=0)] [String] $Name,
        [Parameter(Mandatory=$false, Position=1)] [String] $LogPath
	)

  if (!(Test-ElevatedShell)) { 
    wlog err "Remove-Msi requires elevated shell."
    return 1
  }
    
	$application = Get-WmiObject Win32_Product | ?{$_.Name -like $Name}
  if ($application) {
    $arguments =  '/x', $application.IdentifyingNumber, '/passive'
    if ($LogPath) { $arguments += ("/L*v "+("$LogPath\"+($application| split-path -leaf)+".log")) }
    
    try {
      wlog info "msiexec $arguments"
      Start-Process msiexec $arguments -Wait
      wlog info ( $application.Name+" removed.")
    }
    catch { 
      wlog err ("An error occurred while removing "+$application.Name) 
      return 1
    }
  }	
  else { wlog err ($Name + " not found.") }
  return 0
}