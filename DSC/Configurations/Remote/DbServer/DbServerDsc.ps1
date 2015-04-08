Configuration DbServer {
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
		WindowsFeature FileAndStorage-Services  { Name = 'FileAndStorage-Services'; Ensure = 'Present'; Source = $Source }
		WindowsFeature File-Services  { Name = 'File-Services'; Ensure = 'Present'; Source = $Source }
		WindowsFeature FS-FileServer  { Name = 'FS-FileServer'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Storage-Services  { Name = 'Storage-Services'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Server  { Name = 'Web-Server'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-WebServer  { Name = 'Web-WebServer'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Common-Http  { Name = 'Web-Common-Http'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Default-Doc  { Name = 'Web-Default-Doc'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Dir-Browsing  { Name = 'Web-Dir-Browsing'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Http-Errors  { Name = 'Web-Http-Errors'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Static-Content  { Name = 'Web-Static-Content'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Health  { Name = 'Web-Health'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Http-Logging  { Name = 'Web-Http-Logging'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Request-Monitor  { Name = 'Web-Request-Monitor'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Http-Tracing  { Name = 'Web-Http-Tracing'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Performance  { Name = 'Web-Performance'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Stat-Compression  { Name = 'Web-Stat-Compression'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Security  { Name = 'Web-Security'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Filtering  { Name = 'Web-Filtering'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-App-Dev  { Name = 'Web-App-Dev'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Net-Ext45  { Name = 'Web-Net-Ext45'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-Asp-Net45  { Name = 'Web-Asp-Net45'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-ISAPI-Ext  { Name = 'Web-ISAPI-Ext'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Web-ISAPI-Filter  { Name = 'Web-ISAPI-Filter'; Ensure = 'Present'; Source = $Source }
		WindowsFeature NET-Framework-Features  { Name = 'NET-Framework-Features'; Ensure = 'Present'; Source = $Source }
		WindowsFeature NET-Framework-Core  { Name = 'NET-Framework-Core'; Ensure = 'Present'; Source = $Source }
		WindowsFeature NET-Framework-45-Features  { Name = 'NET-Framework-45-Features'; Ensure = 'Present'; Source = $Source }
		WindowsFeature NET-Framework-45-Core  { Name = 'NET-Framework-45-Core'; Ensure = 'Present'; Source = $Source }
		WindowsFeature NET-Framework-45-ASPNET  { Name = 'NET-Framework-45-ASPNET'; Ensure = 'Present'; Source = $Source }
		WindowsFeature NET-WCF-Services45  { Name = 'NET-WCF-Services45'; Ensure = 'Present'; Source = $Source }
		WindowsFeature NET-WCF-HTTP-Activation45  { Name = 'NET-WCF-HTTP-Activation45'; Ensure = 'Present'; Source = $Source }
		WindowsFeature NET-WCF-TCP-PortSharing45  { Name = 'NET-WCF-TCP-PortSharing45'; Ensure = 'Present'; Source = $Source }
		WindowsFeature ManagementOdata  { Name = 'ManagementOdata'; Ensure = 'Present'; Source = $Source }
		WindowsFeature FS-SMB1  { Name = 'FS-SMB1'; Ensure = 'Present'; Source = $Source }
		WindowsFeature User-Interfaces-Infra  { Name = 'User-Interfaces-Infra'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Server-Gui-Mgmt-Infra  { Name = 'Server-Gui-Mgmt-Infra'; Ensure = 'Present'; Source = $Source }
		WindowsFeature Server-Gui-Shell  { Name = 'Server-Gui-Shell'; Ensure = 'Present'; Source = $Source }
		WindowsFeature PowerShellRoot  { Name = 'PowerShellRoot'; Ensure = 'Present'; Source = $Source }
		WindowsFeature PowerShell  { Name = 'PowerShell'; Ensure = 'Present'; Source = $Source }
		WindowsFeature PowerShell-V2  { Name = 'PowerShell-V2'; Ensure = 'Present'; Source = $Source }
		WindowsFeature DSC-Service  { Name = 'DSC-Service'; Ensure = 'Present'; Source = $Source }
		WindowsFeature PowerShell-ISE  { Name = 'PowerShell-ISE'; Ensure = 'Present'; Source = $Source }
		WindowsFeature WAS  { Name = 'WAS'; Ensure = 'Present'; Source = $Source }
		WindowsFeature WAS-Process-Model  { Name = 'WAS-Process-Model'; Ensure = 'Present'; Source = $Source }
		WindowsFeature WAS-Config-APIs  { Name = 'WAS-Config-APIs'; Ensure = 'Present'; Source = $Source }
		WindowsFeature WoW64-Support  { Name = 'WoW64-Support'; Ensure = 'Present'; Source = $Source }
	
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
		Service MSSQLFDLauncher {
			Name = 'MSSQLFDLauncher$INSTANCE_1'
			StartupType = 'Automatic'
			State = 'Running'
		} 
	
	
	}
}

