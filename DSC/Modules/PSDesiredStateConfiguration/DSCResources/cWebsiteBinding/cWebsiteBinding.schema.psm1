function Get-TargetResource {
    [OutputType([Hashtable])]
    param (
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Name,
		
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Website,
		
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Protocol,
		
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Port,
				
		[Parameter()]
        [ValidateSet('Present', 'Absent')]
        [String]$Ensure = 'Present'
    )
	
	$binding = Get-WebBinding -Name $Website -Protocol $Protocol -Port $Port
	
	if ( $binding ) {
		Write-Verbose "Binding $Protocol@$port located for website $Website"
		$Ensure = 'Present'
	}
	else {
		Write-Verbose "Unable to locate binding $Protocol@$port for website $Website"
		$Ensure = 'Absent'
	}
	
	return @{  
		Name = $Name
		Website = $WebSite
		Protocol = $binding.protocol 
		Port = $binding.port
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
		
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Protocol,
		
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Port,
		
		[Parameter()]
        [ValidateSet('Present', 'Absent')]
        [String]$Ensure = 'Present'
    )
 
	$current = Get-TargetResource -Name $Name -WebSite $WebSite -Protocol $Protocol -Port $Port
	
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
		
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Protocol,
		
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Port,
		
		[Parameter()]
        [ValidateSet('Present', 'Absent')]
        [String]$Ensure = 'Present'
    )
	
	$path = "IIS:\Sites\$WebSite"
	
	$current = Get-TargetResource -Name $Name -WebSite $WebSite -Protocol $Protocol -Port $Port
	
	if ( $Ensure -eq 'Present' -and (-not ($current['Port'])) ) {
		New-ItemProperty -path $path -Name Bindings -Value @{ 
			protocol = $Protocol
			bindingInformation = $Port
		}
	}
	
	elseif ( $Ensure -eq 'Absent' -and $current['Port'] ) {
		Get-WebBinding -Port $Port -Name $Website | Remove-WebBinding
	}
	
}


