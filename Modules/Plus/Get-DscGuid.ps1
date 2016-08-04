function Get-DscGuid {
	[Cmdletbinding()]
	param ()
	
	$mofFiles = Get-ChildItem *.mof
	if (!($mofFiles)) { throw 'No mof files located here.' }
	
	$mofCollection = @()
	
	foreach ($mof in $mofFiles) {
		$computerName = (Get-Content $mof)[1]
		$computerName = $computerName -replace "@TargetNode='",""
		$computerName = $computerName -replace "'",""
		
		$object = New-Object PSObject -Property @{            
			ComputerName = $computerName                 
			Guid = $mof.Basename
			Location = $mof.Fullname
		}
		$mofCollection += $object
	}
	
	return $mofCollection
}
