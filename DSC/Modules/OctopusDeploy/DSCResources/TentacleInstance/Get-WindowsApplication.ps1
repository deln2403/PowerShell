function Get-WindowsApplication {
	param()
	
	$sources = @()
	
	# Define system locations
	$systemLocations = @(
		'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
		'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
	)

	foreach ($location in $systemLocations) {
		$source = New-Object PSObject
		$source | Add-Member -MemberType NoteProperty -Name 'RegistryHive' -Value 'LocalMachine'
		$source | Add-Member -MemberType NoteProperty -Name 'SubKey' -Value $location
		$sources += $source
	}
	
	# Define user specific locations
	if ($env:username) {
		$objUser = New-Object System.Security.Principal.NTAccount($env:username)
		$strSID = ($objUser.Translate([System.Security.Principal.SecurityIdentifier])).Value
		
		$systemLocations = @(
			'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
			'Microsoft\Windows\CurrentVersion\Uninstall'
		)

		foreach ($location in $systemLocations) {
			$source = New-Object PSObject
			$source | Add-Member -MemberType NoteProperty -Name 'RegistryHive' -Value 'Users'
			$source | Add-Member -MemberType NoteProperty -Name 'SubKey' -Value "$strSID\$location"
			$sources += $source
		}
		
		$location = 'Software\Microsoft\Windows\CurrentVersion\Uninstall'
		$source = New-Object PSObject
		$source | Add-Member -MemberType NoteProperty -Name 'RegistryHive' -Value 'CurrentUser'
		$source | Add-Member -MemberType NoteProperty -Name 'SubKey' -Value $location
		$sources += $source
	}
	
	$applications = @()
	
	foreach ($source in $sources) {
		$validSource = $true
	
		# Locate Registry hive
		try {
			$hKey = $source.RegistryHive
			$baseKey = [microsoft.win32.registrykey]::OpenRemoteBaseKey($hKey,$env:ComputerName)
		}
		catch { break }

		#Locate 'Uninstall' SubKey, and its SubKeys
		try {
			$uKey = $source.SubKey
			$subkeys = ($baseKey.OpenSubKey($uKey)).GetSubKeyNames()
		}
		catch {	break	}

		function Get-StdDate ($date) {
			if ($date) {
				try {	return ([datetime]::ParseExact($date,'yyyyMMdd',$null)).toshortdatestring() }
				catch { return }
			}	return }
		
		function Get-StdVersion ($version) {
			if ($version) {
				try {	return [version]$version }
				catch { return }
			} return }
		
		# Create PSObject for each application
		foreach($key in $subkeys){
				$app = $baseKey.OpenSubKey("$uKey\$key")
				$obj = New-Object PSObject
				$obj | Add-Member -MemberType NoteProperty -Name 'Name' -Value $($app.GetValue('DisplayName'))
				$obj | Add-Member -MemberType NoteProperty -Name 'Publisher' -Value $($app.GetValue('Publisher'))
				$obj | Add-Member -MemberType NoteProperty -Name 'Version' -Value $(Get-StdVersion( $($app.GetValue('DisplayVersion')) ))
				$obj | Add-Member -MemberType NoteProperty -Name 'InstallDate' -Value $(Get-StdDate( $($app.GetValue('InstallDate')) ))
				$obj | Add-Member -MemberType NoteProperty -Name 'InstallLocation' -Value $($app.GetValue('InstallLocation'))
				$obj | Add-Member -MemberType NoteProperty -Name 'RegistryHive' -Value $($source.RegistryHive)
				$obj | Add-Member -MemberType NoteProperty -Name 'SubKey' -Value $("$($source.SubKey)\$key")
				$obj | Add-Member -MemberType NoteProperty -Name 'UninstallString' -Value $(($app.GetValue('UninstallString')))
				$applications += $obj
		}		
	}
	
	# Return application list
	$applications | Where-Object { $_.Name } 

}


