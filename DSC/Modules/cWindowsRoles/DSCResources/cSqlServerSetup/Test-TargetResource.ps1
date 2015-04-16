function Test-TargetResource {

    param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[string] $Name,
		
        [ValidateSet('Present', 'Absent')]
        [string]$Ensure = 'Present',

		[Parameter(Mandatory)]
		[ValidateScript({Test-Path $_})]
		[string] $SetupLocation,
		
		[Parameter(Mandatory)]
		[ValidateScript({Test-Path $_})]
		[string] $ConfigPath
    )
 
    $current = Get-TargetResource -Name $Name -SetupLocation $SetupLocation -ConfigPath $ConfigPath
    $pass = $current['Ensure'] -eq $Ensure
	
    Write-Verbose "$Name:: Desired: $Ensure  Current: $($current['Ensure'])  Pass: $pass"
    return $pass
}
