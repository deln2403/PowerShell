<#
function Set-CustomPrompt {
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
    if ($currentPrincipal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )) {
      Write-Host -nonewline -foregroundcolor GRAY $(get-location).toString() 
	    Write-Host -nonewline -foregroundcolor RED '>>'
    }
    else {
	    Write-Host -nonewline -foregroundcolor GRAY $(get-location).toString()
	    Write-Host -nonewline -foregroundcolor YELLOW '>>'
    }
    return ' '  
}

Set-Alias prompt Set-CustomPrompt

#>