. .\WsusServerDsc.ps1


$configData = 
@{
	AllNodes = 
	@(
		@{ 
			NodeName = '*'
			DomainDnsName = 'core.domain.com'
			TimeZone = 'Eastern Standard Time'
			Gateway = '192.168.0.1'
			DnsAddress = @('192.168.0.100','192.168.0.1')
            SevenZipName = '7-Zip'
            SevenZipEnsure = 'Present'
			SevenZipMsiPath = '\\ServerName\DSC\APP\Core\7z938-x64.msi'
		}
		@{     
			NodeName = 'WsusServer01'
			IPAddress = '192.168.0.101'
		}
	) 
}


WsusServerDsc -ConfigurationData $configData -OutputPath .\DSC
