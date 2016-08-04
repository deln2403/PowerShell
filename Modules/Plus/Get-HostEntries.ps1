<#
	Append #{env} to the end of the lines you wish to control.
	You can append however many you want for every line.

	e.g. append #{ALL} to the end of every line and then call Enable/Disable-HostEntries ALL
#>
function Get-HostEntries {
    Param( 
        [Parameter(Mandatory=$false,ValueFromPipeline=$true)]
        [string] $env = 'ALL'
    )

    $content = Get-Content $env:hosts

    foreach ($line in $content) {
        if ( ($line | Select-String "{$env}") )  {
            Write-Host $line
        }
    }
}
