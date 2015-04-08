Configuration WsusServerDsc {
	Param (	)

	Import-DSCResource -Module xTimeZone
	Import-DscResource -Module xNetworking
	Import-DscResource -Module cCommonApps
	Import-DscResource -Module cWindowsRoles

	Node $AllNodes.NodeName 	{
	
		xIPAddress IPAddress {
			InterfaceAlias = 'Ethernet'
			IPAddress = $Node.IPAddress
			AddressFamily = 'IPv4'
			DefaultGateway = $Node.Gateway
			SubnetMask = 24
		}
		 
		xDNSServerAddress DNSAddress {
			InterfaceAlias = 'Ethernet'
			Address = $Node.DnsAddress
			AddressFamily = 'IPv4'
			DependsOn = '[xIPAddress]IPAddress'
		}
	
		xTimeZone TimeZone {
			TimeZone = $Node.TimeZone
		}
		
		c7zip zipApp {
            Name = $Node.SevenZipName
			Ensure = $Node.SevenZipEnsure 
			MsiPath = $Node.SevenZipMsiPath
		}
		
		cUpdateServicesFeatures Features { }
	}
}

