Configuration BasicServer {
	Param (	)

	Import-DSCResource -Module xTimeZone
	Import-DscResource -Module xNetworking
    Import-DscResource -Module cWindowsRoles
	Import-DscResource -ModuleName OctopusDSC

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
	
        Package SevenZip {
            Name = $Node.SevenZipName
            Ensure = $Node.SevenZipEnsure 
            Path = $Node.SevenZipPath
            ProductId = $Node.SevenZipProductId
        }    

        Package OctopusDeployTentacle { 
            Name = $Node.OctoName
            Ensure = $Node.OctoEnsure
            Path = $Node.OctoPath
            ProductId = $Node.OctoProductId
        }
 
        cTentacleAgent OctopusDeployTentacleConfiguration { 
            Ensure = $Node.OctoEnsure 
            State = $Node.OctoTentacleState
            Name = $Node.OctoTentacleName
            ApiKey = $Node.OctoApiKey
            OctopusServerUrl = $Node.OctoServerUrl
            Environments = $Node.OctoEnvironments
            Roles = $Node.OctoRoles
            ListenPort = $Node.OctoListenPort
            DefaultApplicationDirectory = $Node.OctoDefaultApplicationDirectory
            DependsOn = '[Package]OctopusDeployTentacle' 
        } 
	
	}
}

