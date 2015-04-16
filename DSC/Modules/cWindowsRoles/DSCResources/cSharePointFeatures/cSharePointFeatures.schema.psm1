<#
http://social.technet.microsoft.com/wiki/contents/articles/14582.sharepoint-2013-install-prerequisites-offline-or-manually-on-windows-server-2012-a-comprehensive-guide.aspx
#>
Configuration cSharePointFeatures {
	param ( 
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
        [ValidateScript({Test-Path $_})]
		[string] $Source
    )
	
	WindowsFeature NET-WCF-HTTP-Activation45 { Name = 'NET-WCF-HTTP-Activation45'; Ensure = 'Present'; Source = $Source }
	WindowsFeature NET-WCF-TCP-Activation45 { Name = 'NET-WCF-TCP-Activation45'; Ensure = 'Present'; Source = $Source }
	WindowsFeature NET-WCF-Pipe-Activation45 { Name = 'NET-WCF-Pipe-Activation45'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Net-Framework-Features { Name = 'Net-Framework-Features'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Server { Name = 'Web-Server'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-WebServer { Name = 'Web-WebServer'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Common-Http { Name = 'Web-Common-Http'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Static-Content { Name = 'Web-Static-Content'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Default-Doc { Name = 'Web-Default-Doc'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Dir-Browsing { Name = 'Web-Dir-Browsing'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Http-Errors { Name = 'Web-Http-Errors'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-App-Dev { Name = 'Web-App-Dev'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Asp-Net { Name = 'Web-Asp-Net'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Net-Ext { Name = 'Web-Net-Ext'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-ISAPI-Ext { Name = 'Web-ISAPI-Ext'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-ISAPI-Filter { Name = 'Web-ISAPI-Filter'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Health { Name = 'Web-Health'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Http-Logging { Name = 'Web-Http-Logging'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Log-Libraries { Name = 'Web-Log-Libraries'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Request-Monitor { Name = 'Web-Request-Monitor'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Http-Tracing { Name = 'Web-Http-Tracing'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Security { Name = 'Web-Security'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Basic-Auth { Name = 'Web-Basic-Auth'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Windows-Auth { Name = 'Web-Windows-Auth'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Filtering { Name = 'Web-Filtering'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Digest-Auth { Name = 'Web-Digest-Auth'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Performance { Name = 'Web-Performance'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Stat-Compression { Name = 'Web-Stat-Compression'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Dyn-Compression { Name = 'Web-Dyn-Compression'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Mgmt-Tools { Name = 'Web-Mgmt-Tools'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Mgmt-Console { Name = 'Web-Mgmt-Console'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Mgmt-Compat { Name = 'Web-Mgmt-Compat'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Metabase { Name = 'Web-Metabase'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Application-Server { Name = 'Application-Server'; Ensure = 'Present'; Source = $Source }
	WindowsFeature AS-Web-Support { Name = 'AS-Web-Support'; Ensure = 'Present'; Source = $Source }
	WindowsFeature AS-TCP-Port-Sharing { Name = 'AS-TCP-Port-Sharing'; Ensure = 'Present'; Source = $Source }
	WindowsFeature AS-WAS-Support { Name = 'AS-WAS-Support'; Ensure = 'Present'; Source = $Source }
	WindowsFeature AS-HTTP-Activation { Name = 'AS-HTTP-Activation'; Ensure = 'Present'; Source = $Source }
	WindowsFeature AS-TCP-Activation { Name = 'AS-TCP-Activation'; Ensure = 'Present'; Source = $Source }
	WindowsFeature AS-Named-Pipes { Name = 'AS-Named-Pipes'; Ensure = 'Present'; Source = $Source }
	WindowsFeature AS-Net-Framework { Name = 'AS-Net-Framework'; Ensure = 'Present'; Source = $Source }
	WindowsFeature WAS { Name = 'WAS'; Ensure = 'Present'; Source = $Source }
	WindowsFeature WAS-Process-Model { Name = 'WAS-Process-Model'; Ensure = 'Present'; Source = $Source }
	WindowsFeature WAS-NET-Environment { Name = 'WAS-NET-Environment'; Ensure = 'Present'; Source = $Source }
	WindowsFeature WAS-Config-APIs { Name = 'WAS-Config-APIs'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Web-Lgcy-Scripting { Name = 'Web-Lgcy-Scripting'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Windows-Identity-Foundation { Name = 'Windows-Identity-Foundation'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Server-Media-Foundation { Name = 'Server-Media-Foundation'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Xps-Viewer { Name = 'Xps-Viewer'; Ensure = 'Present'; Source = $Source }
}
