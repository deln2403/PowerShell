<#
.SYNOPSIS
 Returns an array of elements in a comma seperated string
 
.PARAMETER List
	String list of elemets

.EXAMPLE
 ConvertFrom-ListToArray -List 'one,two,three'

#>
function ConvertFrom-ListToArray {
  Param(
    [Parameter(Mandatory=$true)] $List
  )
	
	try {	return $List.Split(',') }
	catch { throw 'Error converting Tech RegistryKey to PSOject' }

}