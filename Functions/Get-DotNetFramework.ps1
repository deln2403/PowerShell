# https://msdn.microsoft.com/en-us/library/hh925568(v=vs.110).aspx

function Get-DotNetFramework {
	Switch ((Get-ItemProperty  'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\').Release) {
		378389 {$version = [version]'4.5'}
		378675 {$version = [version]'4.5.1'}
		378758 {$version = [version]'4.5.1'}
		379893 {$version = [version]'4.5.2'}
		393295 {$version = [version]'4.6'}
		393297 {$version = [version]'4.6'}
		394254 {$version = [version]'4.6.1'}
		394271 {$version = [version]'4.6.1'}
		default {}
	}

	if ($version) { 
		return $version 
	}
	return [version](Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' | `
		Select -ExpandProperty Name | `
			% { (Split-Path $_ -leaf).Replace('v','') } | `
				Select -Last 1)
}
