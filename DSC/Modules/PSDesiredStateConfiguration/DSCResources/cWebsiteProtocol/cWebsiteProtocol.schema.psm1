function Get-TargetResource {
    [OutputType([Hashtable])]
    param (
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Name,
		
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Website
    )
	
	$path = "IIS:\Sites\$WebSite"
	
	$enabledProtocols = ((Get-ItemProperty $Path).EnabledProtocols).Split(',')
	if ( $enabledProtocols -contains $Name ) { $Ensure = 'Present' }
	else { $Ensure = 'Absent' }
	
	return @{
		Name = $Name
		Website	= $Website
		Ensure = $Ensure
	}
}

function Test-TargetResource {
    param (
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Name,
		
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Website,

		[Parameter()]
        [ValidateSet('Present', 'Absent')]
        [String]$Ensure = 'Present'
    )
 
	$current = Get-TargetResource -Name $Name -WebSite $WebSite
	
    if ( $Ensure -ne $current['Ensure'] ) { return $false }
	return $true
}


function Set-TargetResource {
	param (
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Name,
		
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Website,
		
		[Parameter()]
        [ValidateSet('Present', 'Absent')]
        [String]$Ensure = 'Present'
    )
	
	$path = "IIS:\Sites\$WebSite"
	
	$current = Get-TargetResource -Name $Name -WebSite $WebSite
	$enabledProtocols = ((Get-ItemProperty $Path).EnabledProtocols)
	
	if ( $Ensure -eq 'Present' -and $current['Ensure'] -eq 'Absent' ) {
		if ($enabledProtocols) {
			Set-ItemProperty $path -name EnabledProtocols -Value "$enabledProtocols,$Name"
		}
		else { Set-ItemProperty $path -name EnabledProtocols -Value $Name }
	}
	
	elseif ( $Ensure -eq 'Absent' -and $current['Ensure'] -eq 'Present' ) {
		if ($enabledProtocols -eq $Name) {
			Set-ItemProperty $path -name EnabledProtocols -Value ''
		}
		else { 
			$newProtocols = $enabledProtocols -replace ",$Name", ''
			$newProtocols = $newProtocols -replace "$Name,", ''
			
			Set-ItemProperty $path -name EnabledProtocols -Value $newProtocols
		}
	}
	
}


