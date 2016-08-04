<#
.SYNOPSIS
    Installs an msi

.DESCRIPTION
    Installs an msi specified by a full path
    
.PARAMETER Path
    Absolute path of msi to install
    
.PARAMETER InstallDir
    Absolute path of msi to install
    
.PARAMETER LogPath
    Absolute path of msi to install
    
.EXAMPLE
    Install-Msi C:\Dev\RTA\Payload\Services\Png.Rta.Installer.msi

.EXAMPLE
    Install-Msi -Path "C:\New Folder\RTA\Payload\Services\Png.Rta.Installer.msi" -Log C:\log.txt
#>
function Install-Msi {
	Param(
		[Parameter(Mandatory=$true, Position=0)] [String] $Path,
		[Parameter(Mandatory=$false, Position=1)] [String] $InstallDir,
		[Parameter(Mandatory=$false, Position=2)] [String] $LogPath
	)
	
	$tech = (Get-Pkg -Manifest -Content).Manifest.Tech

  if (!(Test-ElevatedShell)) { 
    Write-WinLog  -Source $tech -EntryType 'Error' -EventId 550 `
			-Message 'Function $($MyInvocation.MyCommand) - Requires elevated shell.'
			return 1
  }
    
  if (!(Test-Path $Path)) {
    Write-WinLog  -Source $tech -EntryType 'Error' -EventId 550 `
			-Message "Function $($MyInvocation.MyCommand) - Unable to located $Path"
    return 1 
  }
  
  $arguments =  '/i', $Path, '/qb', '/passive'
  if ($LogPath) { 
    $arguments += ("/L*v "+("$LogPath\"+($application| split-path -leaf)+".log")) }
  if ($InstallDir) { $arguments += ('INSTALLDIR="'+$InstallDir+'"') }
  
	Write-WinLog  -Source $tech -EntryType 'Information' -EventId 100 `
		-Message "Function $($MyInvocation.MyCommand) - msiexec $arguments"
		
  try {
    Start-Process msiexec $arguments -Wait
	Write-WinLog  -Source $tech -EntryType 'Information' -EventId 100 `
		-Message "Function $($MyInvocation.MyCommand) - $Path installed."
  }
  catch {
		Write-WinLog  -Source $tech -EntryType 'Error' -EventId 550 `
			-Message "Function $($MyInvocation.MyCommand) - An error occurred while installing $Path"
    return 1
  } 
	
  return 0
}