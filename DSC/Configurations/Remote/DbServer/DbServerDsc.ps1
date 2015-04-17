Configuration DbServer {
	Param (	)

	Import-DSCResource -Module xTimeZone
	Import-DscResource -Module xNetworking
    Import-DscResource -Module cWindowsRoles
	Import-DscResource -Module OctopusDeploy
	Import-DscResource -Module cNetworkingFirewall
    Import-DscResource -Module cDistributedTransactionCoordinator

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
		cSqlServerFeatures Features { 
            Source = $Node.FeaturesSourcePath
        }
	
	#--------------------------------
	# MS DTC
	#------------------------------------------------------------------
		cDtc LocalDtc {
			DtcName = 'local'
			Status = 'Started'
		}
		
		cDtcNetworkSetting LocalDtcNetworkSetting {
			DtcName = 'local'
			AuthenticationLevel = 'NoAuth'
			InboundTransactionsEnabled = $true
			OutboundTransactionsEnabled = $true
			RemoteClientAccessEnabled = $true
			RemoteAdministrationAccessEnabled = $true
			XATransactionsEnabled = $true
			LUTransactionsEnabled = $true
		}
	
	#--------------------------------
	# Core Packages
	#------------------------------------------------------------------
        Package PkgSevenZip {
            Name = $Node.PkgSevenZipName
            Ensure = $Node.PkgSevenZipEnsure 
            Path = $Node.PkgSevenZipPath
            ProductId = $Node.PkgSevenZipProductId
        }
		
        Package PkgOctoTentacle { 
            Name = $Node.PkgOctoName
            Ensure = $Node.PkgOctoEnsure
            Path = $Node.PkgOctoPath
            ProductId = $Node.PkgOctoProductId
        }

        OctopusTentacle OctoTentacleConfig { 
            InstanceName = 'Tentacle'
            ServicePath = $Node.OctoServicePath
            Ensure = 'Present'
            State = 'Running'
            StartMode = 'Auto'
            PortNumber = 10933
            ApiKey = $Node.OctoApiKey
            OctopusServerUrl = $Node.OctoServerUrl
            IpAddress = $Node.IPAddress
            Environments = $Node.OctoEnvironments
            Roles = $Node.OctoRoles
            DependsOn = '[Package]PkgOctoTentacle' 
        }
	
	#--------------------------------
    # MSSQL Setup
    #------------------------------------------------------------------
        cSqlServerSetup MsSqlServer {
            Name = 'SqlServer'
			Ensure = 'Present'
            SetupLocation = $Node.MsSqlSetupLocation
            ConfigPath = $Node.MsSqlConfigPath
        }	
	
	#--------------------------------
	# Dynamics AX AOS Prerequisites
	#------------------------------------------------------------------
		Service MSSQLFDLauncher {
			Name = 'MSSQLFDLauncher$INSTANCE_1'
			StartupType = 'Automatic'
			State = 'Running'
		}
	
	}
}

