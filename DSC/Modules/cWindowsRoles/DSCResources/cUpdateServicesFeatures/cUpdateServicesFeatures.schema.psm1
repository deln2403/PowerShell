Configuration cUpdateServicesFeatures {
	param ( 
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
        [ValidateScript({Test-Path $_})]
		[string] $Source
    )

	WindowsFeature FileAndStorage-Services { Name = 'FileAndStorage-Services'; Ensure = 'Present'; Source = $Source }
	WindowsFeature File-Services { Name = 'File-Services'; Ensure = 'Present'; Source = $Source }
	WindowsFeature FS-FileServer { Name = 'FS-FileServer'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Storage-Services { Name = 'Storage-Services'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Server { Name = 'Web-Server'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-WebServer { Name = 'Web-WebServer'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Common-Http { Name = 'Web-Common-Http'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Default-Doc { Name = 'Web-Default-Doc'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Dir-Browsing { Name = 'Web-Dir-Browsing'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Http-Errors { Name = 'Web-Http-Errors'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Static-Content { Name = 'Web-Static-Content'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Health { Name = 'Web-Health'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Http-Logging { Name = 'Web-Http-Logging'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Request-Monitor { Name = 'Web-Request-Monitor'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Http-Tracing { Name = 'Web-Http-Tracing'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Performance { Name = 'Web-Performance'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Stat-Compression { Name = 'Web-Stat-Compression'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Dyn-Compression { Name = 'Web-Dyn-Compression'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Security { Name = 'Web-Security'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Filtering { Name = 'Web-Filtering'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Windows-Auth { Name = 'Web-Windows-Auth'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-App-Dev { Name = 'Web-App-Dev'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Net-Ext45 { Name = 'Web-Net-Ext45'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Asp-Net45 { Name = 'Web-Asp-Net45'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-ISAPI-Ext { Name = 'Web-ISAPI-Ext'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-ISAPI-Filter { Name = 'Web-ISAPI-Filter'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Mgmt-Tools { Name = 'Web-Mgmt-Tools'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Mgmt-Console { Name = 'Web-Mgmt-Console'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Mgmt-Compat { Name = 'Web-Mgmt-Compat'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Metabase { Name = 'Web-Metabase'; Ensure = 'Present'; Source = $Source }
	WindowsFeature UpdateServices { Name = 'UpdateServices'; Ensure = 'Present'; Source = $Source }
	WindowsFeature UpdateServices-WidDB { Name = 'UpdateServices-WidDB'; Ensure = 'Present'; Source = $Source }
	WindowsFeature UpdateServices-Services { Name = 'UpdateServices-Services'; Ensure = 'Present'; Source = $Source }
	WindowsFeature NET-Framework-45-Features { Name = 'NET-Framework-45-Features'; Ensure = 'Present'; Source = $Source }
	WindowsFeature NET-Framework-45-Core { Name = 'NET-Framework-45-Core'; Ensure = 'Present'; Source = $Source }
	WindowsFeature NET-Framework-45-ASPNET { Name = 'NET-Framework-45-ASPNET'; Ensure = 'Present'; Source = $Source }
	WindowsFeature NET-WCF-Services45 { Name = 'NET-WCF-Services45'; Ensure = 'Present'; Source = $Source }
	WindowsFeature NET-WCF-HTTP-Activation45 { Name = 'NET-WCF-HTTP-Activation45'; Ensure = 'Present'; Source = $Source }
	WindowsFeature NET-WCF-TCP-PortSharing45 { Name = 'NET-WCF-TCP-PortSharing45'; Ensure = 'Present'; Source = $Source }
	WindowsFeature ManagementOdata { Name = 'ManagementOdata'; Ensure = 'Present'; Source = $Source }
	WindowsFeature RSAT { Name = 'RSAT'; Ensure = 'Present'; Source = $Source }
	WindowsFeature RSAT-Role-Tools { Name = 'RSAT-Role-Tools'; Ensure = 'Present'; Source = $Source }
	WindowsFeature UpdateServices-RSAT { Name = 'UpdateServices-RSAT'; Ensure = 'Present'; Source = $Source }
	WindowsFeature UpdateServices-API { Name = 'UpdateServices-API'; Ensure = 'Present'; Source = $Source }
	WindowsFeature UpdateServices-UI { Name = 'UpdateServices-UI'; Ensure = 'Present'; Source = $Source }
	WindowsFeature FS-SMB1 { Name = 'FS-SMB1'; Ensure = 'Present'; Source = $Source }
	WindowsFeature User-Interfaces-Infra { Name = 'User-Interfaces-Infra'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Server-Gui-Mgmt-Infra { Name = 'Server-Gui-Mgmt-Infra'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Server-Gui-Shell { Name = 'Server-Gui-Shell'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Windows-Internal-Database { Name = 'Windows-Internal-Database'; Ensure = 'Present'; Source = $Source }
	WindowsFeature PowerShellRoot { Name = 'PowerShellRoot'; Ensure = 'Present'; Source = $Source }
	WindowsFeature PowerShell { Name = 'PowerShell'; Ensure = 'Present'; Source = $Source }
	WindowsFeature DSC-Service { Name = 'DSC-Service'; Ensure = 'Present'; Source = $Source }
	WindowsFeature PowerShell-ISE { Name = 'PowerShell-ISE'; Ensure = 'Present'; Source = $Source }
	WindowsFeature WAS { Name = 'WAS'; Ensure = 'Present'; Source = $Source }
	WindowsFeature WAS-Process-Model { Name = 'WAS-Process-Model'; Ensure = 'Present'; Source = $Source }
	WindowsFeature WAS-Config-APIs { Name = 'WAS-Config-APIs'; Ensure = 'Present'; Source = $Source }
	WindowsFeature WoW64-Support { Name = 'WoW64-Support'; Ensure = 'Present'; Source = $Source }
}
