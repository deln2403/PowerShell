Configuration AxServerDsc {
	Param (	)

	Import-DSCResource -Module xTimeZone
	Import-DscResource -Module xNetworking
	Import-DscResource -ModuleName OctopusDSC
    Import-DscResource -Module cWindowsRoles
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
		cDynamicsAxAosFeatures Features { 
			Source = $Node.FeaturesSourcePath
		}
		
		#WindowsFeature NET-Framework-Core { 
		#	Name = 'NET-Framework-Core'
		#	Ensure = 'Present'
		#	Source = $Node.FeaturesSourcePath
		#}

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
	# AX AOS Prerequisites
	#------------------------------------------------------------------
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
		
		# Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.17
		Package Vcredist2008x86 { 
            Name = $Node.PkgVcredist2008x86Name
			ProductId = $Node.PkgVcredist2008x86ProductId
            Path = $Node.PkgVcredist2008x86Path
			Arguments = $Node.PkgVcredist2008x86Args
			Ensure = 'Present'
        }
		
		# Microsoft Visual C++ 2008 SP1 Redistributable Package (x64)
		Package Vcredist2008x64 { 
            Name = $Node.PkgVcredist2008x64Name
			ProductId = $Node.PkgVcredist2008x64ProductId
            Path = $Node.PkgVcredist2008x64Path
			Arguments = $Node.PkgVcredist2008x64Args
			Ensure = 'Present'
        }
					
		# Microsoft Visual C++ 2010  x86 Redistributable - 10.0.30319
		Package Vcredist2010x86 { 
            Name = $Node.PkgVcredist2010x86Name
			ProductId = $Node.PkgVcredist2010x86ProductId
            Path = $Node.PkgVcredist2010x86Path
			Arguments = $Node.PkgVcredist2010x86Args
			Ensure = 'Present'
        }
		
		# Microsoft Visual C++ 2010  x64 Redistributable - 10.0.30319
		Package Vcredist2010x64 { 
            Name = $Node.PkgVcredist2010x64Name
			ProductId = $Node.PkgVcredist2010x64ProductId
            Path = $Node.PkgVcredist2010x64Path
			Arguments = $Node.PkgVcredist2010x64Args
			Ensure = 'Present'
        }
		
		# Microsoft Visual C++ 2012 Redistributable (x86) - 11.0.61030
		Package Vcredist2012x86 { 
            Name = $Node.PkgVcredist2012x86Name
            ProductId = $Node.PkgVcredist2012x86ProductId
            Path = $Node.PkgVcredist2012x86Path
			Arguments = $Node.PkgVcredist2012x86Args
			Ensure = 'Present'
        }
		
		# Microsoft Visual C++ 2012 Redistributable (x64) - 11.0.61030
		Package Vcredist2012x64 { 
            Name = $Node.PkgVcredist2012x64Name
            ProductId = $Node.PkgVcredist2012x64ProductId
            Path = $Node.PkgVcredist2012x64Path
			Arguments = $Node.PkgVcredist2012x64Args
			Ensure = 'Present'
        }
		
		# Microsoft SQL Server 2012 Native Client
		Package SqlNc { 
            Name = $Node.PkgSqlNcName
			ProductId = $Node.PkgSqlNcProductId
            Path = $Node.PkgSqlNcPath
			Arguments = $Node.PkgSqlNcArgs
			Ensure = 'Present'
        }
		
		# SharePoint Server 2013 Client Components SDK
		Package SpClient { 
            Name = $Node.PkgSpClientName
            ProductId = $Node.PkgSpClientProductId
            Path = $Node.PkgSpClientPath
			Arguments = $Node.PkgSpClientArgs
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

