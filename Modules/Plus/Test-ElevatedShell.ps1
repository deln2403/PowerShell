<#
.SYNOPSIS
	Returns $true is current shell has elevated priviliges. if not, returns $false

.DESCRIPTION
	Checks that the current window's (shell) security principal is part of the
	Administrator Windows' Built in Role  

.EXAMPLE
	$isAdmin = Test-ElevatedShell
#>
function Test-ElevatedShell() {
  $currentPrincipal = New-Object Security.Principal.WindowsPrincipal( `
    [Security.Principal.WindowsIdentity]::GetCurrent() )
  if ($currentPrincipal.IsInRole( `
    [Security.Principal.WindowsBuiltInRole]::Administrator )) {return $true}
  else { return $null }
}