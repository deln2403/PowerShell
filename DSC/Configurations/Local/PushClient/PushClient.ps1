Configuration PushClient {
	Param (
		[string] $NodeFQDN
	)

	Node $NodeFQDN {
		LocalConfigurationManager {
			ConfigurationMode = 'ApplyAndMonitor'
			ConfigurationID = ''
			RefreshMode = 'PUSH'
			DownloadManagerName = ''
			DownloadManagerCustomData = $null
		}
	}
}

$nodeFQDN = 'servername.core.domain.com'
$path = '.\DSC'

PushClient -NodeFQDN $nodeFQDN
Set-DSCLocalConfigurationManager –ComputerName $nodeFQDN -Path $path –Verbose
