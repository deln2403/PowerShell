function Get-LocallyLoggedOnUser {
	[CmdletBinding()]
	param(
			[Parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)][Alias('Cn')][string[]] $ComputerName
	)

	process {
			foreach ($Computer in $ComputerName) {
					Write-Verbose "Processing $Computer"
					$Output = @(.\PsLoggedon.exe -l "\\$Computer" 2> $env:TEMP\psloggedon.tmp)
					if ($Output -imatch 'Error') {
							New-Object PSObject -Property @{
									ComputerName = $Computer
									Date         = $null
									Domain       = $null
									User         = $null
									Error        = ($Output | Where-Object { $_ -match '\S' }) -join ' ; '
							} | Select ComputerName, Date, Domain, User, Error
					}
					$Output | ForEach-Object {
							if ($_ -match '\s+(?<DateTime>(?:.?unknown time.?|\d{1,2}/\d{1,2}/\d{4}\s+\d{1,2}:\d{1,2}:\d{1,2}\s+[ap]m))\s+(?<DomainUser>\S+)') {
									$DomainUser = $Matches.DomainUser
									if ($Matches.DateTime -imatch 'unknown time') {
											$Date = $null
									}
									else {
											$Date = $Matches.DateTime
									}
									if ($Date) {
											# Pad single digits in date and time with zeroes (I'm a magician).
											# This is so that we can use [datetime]::ParseExact() in one format rather
											# than having like 10 if/else statements and repeated code.
											# ... And I sort of really wanted that sortable date object.
											## Bugs made me abandon this idea...
											#$Date = $Date -replace '(?<!\d)(\d(?:[/:\s]|$))', '0$1'
											#Write-Host -Fore Green $Date
											#$Date = [datetime]::ParseExact($Date, 'MM/dd/yyyy hh:mm:ss tt', [CultureInfo]::InvariantCulture) # buggy, works on other host with US locale
											#$Date = Get-Date -UFormat '%M/%d/%Y %r' ... uh, $Date
											
											# And I ended up with a cast...
											$Date = [datetime]$Date
									}
									New-Object PSObject -Property @{
											ComputerName = $Computer
											Date         = $Date
											Domain       = $DomainUser.Split('\')[0]
											User         = $DomainUser.Split('\')[1]
											Error        = $null
									}
							}
					} | Select ComputerName, Date, Domain, User, Error
			}
	}
}