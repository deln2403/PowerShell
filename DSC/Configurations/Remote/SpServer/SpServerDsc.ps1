Configuration SpServerDsc {
	Param (	)

	Import-DSCResource -Module xTimeZone
	Import-DscResource -Module xNetworking
    Import-DscResource -Module cWindowsRoles
	Import-DscResource -ModuleName OctopusDSC
	Import-DscResource -ModuleName cNetworkingFirewall

	Node $AllNodes.NodeName 	{
	
	#--------------------------------
	# Computer Configuration
	#------------------------------------------------------------------
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
		
		cFirewallProfile DomainFW {
			Name = 'Domain'
			Ensure = $Node.FirewallDomainEnsure
		}
		
		cFirewallProfile PrivateFW {
			Name = 'Private'
			Ensure = $Node.FirewallPrivateEnsure
		}
		
		cFirewallProfile PublicFW {
			Name = 'Public'
			Ensure = $Node.FirewallPublicEnsure
		}
		
		
	#--------------------------------
	# Windows Features
	#------------------------------------------------------------------
		cSharePointFeatures Features {  }

		WindowsFeature PowerShell-V2  { 
			Name = 'PowerShell-V2'
			Ensure = 'Present'
			Source = $FeaturesSourcePath
		}
	
	#--------------------------------
	# Core Packages
	#------------------------------------------------------------------
        Package SevenZip {
            Name = $Node.PkgSevenZipName
            Ensure = $Node.PkgSevenZipEnsure 
            Path = $Node.PkgSevenZipPath
            ProductId = $Node.PkgSevenZipProductId
        }
		
        Package OctopusDeployTentacle { 
            Name = $Node.PkgOctoName
            Ensure = $Node.PkgOctoEnsure
            Path = $Node.PkgOctoPath
            ProductId = $Node.PkgOctoProductId
        }

        cTentacleAgent OctopusDeployTentacleConfiguration { 
            Ensure = 'Present'
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
	
	#--------------------------------
	# AX EP Prerequisites
	#------------------------------------------------------------------
		# Microsoft SQL Server 2008 R2 Native Client
		# Package Sql2008R2Nc { 
        #    Name = $Node.PkgSql2008R2NcName
		#	ProductId = $Node.PkgSql2008R2NcProductId
        #    Path = $Node.PkgSql2008R2NcPath
		#	Arguments = $Node.PkgSql2008R2NcArgs
		#	Ensure = 'Present'
        #}
		
		# Microsoft SQL Server 2008 R2 ADOMD.NET
		Package Sql2008R2Adom { 
            Name = $Node.PkgSql2008R2AdomName
			ProductId = $Node.PkgSql2008R2AdomProductId
            Path = $Node.PkgSql2008R2AdomPath
			Arguments = $Node.PkgSql2008R2AdomArgs
			Ensure = 'Present'
        }
		
		# Microsoft Chart Controls for Microsoft .NET Framework 3.5
		Package MsChart { 
            Name = $Node.PkgMsChartName
			ProductId = $Node.PkgMsChartProductId
            Path = $Node.PkgMsChartPath
			Arguments = $Node.PkgMsChartArgs
			Ensure = 'Present'
        }
		
		# Open XML SDK 2.0 for Microsoft Office
		Package OXS2 { 
            Name = $Node.PkgOXS2Name
			ProductId = $Node.PkgOXS2ProductId
            Path = $Node.PkgOXS2Path
			Arguments = $Node.PkgOXS2tArgs
			Ensure = 'Present'
        }
		
		# Open XML SDK 2.0 Productivity Tool for Microsoft Office
		Package OXS2T { 
            Name = $Node.PkgOXS2TName
			ProductId = $Node.PkgOXS2TProductId
            Path = $Node.PkgOXS2TPath
			Arguments = $Node.PkgOXS2TArgs
			Ensure = 'Present'
        }
		
		# Microsoft Report Viewer 2010 Redistributable Package
		Package ReportVwr2010 { 
            Name = $Node.PkgReportVwr2010Name
            ProductId = $Node.PkgReportVwr2010ProductId
            Path = $Node.PkgReportVwr2010Path
			Arguments = $Node.PkgReportVwr2010Args
			Ensure = 'Present'
        }
		
		# Microsoft SQL Server Analysis Management Objects
		Package SqlAmo { 
            Name = $Node.PkgSqlAmoName
            ProductId = $Node.PkgSqlAmoProductId
            Path = $Node.PkgSqlAmoPath
			Arguments = $Node.PkgSqlAmoArgs
			Ensure = 'Present'
        }
	}
}

