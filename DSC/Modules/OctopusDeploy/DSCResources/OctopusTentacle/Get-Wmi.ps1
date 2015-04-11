<#
.SYNOPSIS
	Returns WMI information

.DESCRIPTION
	Returns namespaces, classes or wmiInstance information

.PARAMETER Namespace

.PARAMETER ListNamespace

.EXAMPLE
	Get-Wmi
	
.EXAMPLE
	Get-Wmi -Namespace win32_service
	
.EXAMPLE
	Get-Wmi -ListNamespace 'security'
	
.EXAMPLE
	Get-Wmi -Class win32_service

#>
Function Get-Wmi {
	[Cmdletbinding()]
  param (
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$true,
      Position=0)]
		[ValidateNotNullOrEmpty()]
		[string] $Class,
		
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$true,
      Position=1)]
		[ValidateNotNullOrEmpty()]
		[string] $Namespace = 'cimv2',
		
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$true,
      Position=2)]
		[ValidateNotNullOrEmpty()]
		[string] $NamespaceRoot = 'root',
		
		[switch] $ListNamespace
	)
	
	if ($ListNamespace -and ($Class)) { throw 'Invalid arguments.' }
	
	if ($ListNamespace) {
		return Get-WmiObject -Namespace $NamespaceRoot -Class '__Namespace' | Select Name
	}
	
	if ($Class) { return Get-CimInstance $Class }
	
	Get-WmiObject -Namespace "$NamespaceRoot\$Namespace" -list
}









