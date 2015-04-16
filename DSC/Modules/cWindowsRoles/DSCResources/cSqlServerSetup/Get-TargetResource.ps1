function Get-TargetResource {
	[OutputType([Hashtable])]
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

    Write-Verbose "Checking if $Name is installed"
    if ( Get-WindowsApplication | ? Name -eq "SQL Server 2012 Database Engine Services" ) {
		$current = 'Present'
	}
	else { $current = 'Absent' }
	
	return @{
        Name = $Name; 
        Ensure = $current;
    }
}
