
<#
.SYNOPSIS

.DESCRIPTION

.EXAMPLE
#>
function Clear-Dns { Invoke-command -ScriptBlock { ipconfig '/flushdns' } } 

Set-Alias -Name Flush-Dns -Value Clear-Dns

