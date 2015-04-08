# e.g. $env:ComputerName
$computerName = ''

# e.g. $env:UserDnsDomain
$domainDnsName = 'core.domain.com'

# e.g. \\server\DSC\Modules
$modulesPath = ''

# e.g. IPv4  # e.g. 192.168.0.205
$iPAddress = '' 

# e.g. IPv4
$defaultGateway = '192.168.0.1'

# e.g. IPv4
$dnsAddress = @('192.168.0.100','192.168.0.1')

# e.g. Eastern Standard Time
$timeZone = 'Eastern Standard Time'


$workingDirectory = 'DSC'
$credential = (Get-Credential)
## [switch] Prompt - prompt user at ever step
## [switch] Clean  - remove confirmation files



# Load functions
try { Get-ChildItem -Path "$PSScriptRoot\$workingDirectory\*.ps1" | Foreach-Object{ . $_.FullName } } 
catch { throw 'Error loading Functions' }

# Get Dsc Module
Get-DscModule -SourcePath $modulesPath -Credential $credential -Clean #-Prompt

# Set Dsc Network
Set-DscNetwork -IPAddress $iPAddress -DefaultGateway $defaultGateway -DnsAddress $dnsAddress -Clean #-Prompt
Start-Sleep 5 # Allow networking to stabilize

# Join Dsc Domain
Join-DscDomain -TimeZone $timeZone -ComputerName $computerName -DomainDnsName $domainDnsName -Credential $credential -Clean #-Prompt
