<#
	Append #{env} to the end of the lines you wish to control.
	You can append however many you want for every line.

	e.g. append #{ALL} to the end of every line and then call Enable/Disable-HostEntries ALL
#>
function Disable-HostEntries {
    Param( 
        [Parameter(Mandatory=$false,ValueFromPipeline=$true)] 
        [string] $env = 'ALL'
    ) 

    if (!(Test-ElevatedShell)) { throw 'Run as admin' }

    $content = Get-Content $env:hosts
    $newContent = @()

    foreach ($line in $content) {
        if ( ($line | Select-String "{$env}") -and !($line -match "^#") )  {
			$newLine = "#$line"
            $newContent += $newLine
        }
        else { $newContent += $line }
    }

	Set-Content -Value $newcontent -Path $env:hosts
}
