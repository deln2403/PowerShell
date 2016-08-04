<#
.SYNOPSIS

.DESCRIPTION

.EXAMPLE
#>
Function Get-Invocation {
	return (((Get-Variable MyInvocation -Scope 1).Value).MyCommand).Name
}
