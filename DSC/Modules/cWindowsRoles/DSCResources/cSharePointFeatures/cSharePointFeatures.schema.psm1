<#
	http://social.technet.microsoft.com/wiki/contents/articles/14582.sharepoint-2013-install-prerequisites-offline-or-manually-on-windows-server-2012-a-comprehensive-guide.aspx
	Microsoft_2013_SharePointFoundation_Prereqs
#>
Configuration cSharePointFeatures {
	
	WindowsFeature NET-WCF-HTTP-Activation45 { Name = 'NET-WCF-HTTP-Activation45'; Ensure = 'Present' }
	WindowsFeature NET-WCF-TCP-Activation45 { Name = 'NET-WCF-TCP-Activation45'; Ensure = 'Present' }
	WindowsFeature NET-WCF-Pipe-Activation45 { Name = 'NET-WCF-Pipe-Activation45'; Ensure = 'Present' }
	WindowsFeature Net-Framework-Features { Name = 'Net-Framework-Features'; Ensure = 'Present' }
	WindowsFeature Web-Server { Name = 'Web-Server'; Ensure = 'Present' }
	WindowsFeature Web-WebServer { Name = 'Web-WebServer'; Ensure = 'Present' }
	WindowsFeature Web-Common-Http { Name = 'Web-Common-Http'; Ensure = 'Present' }
	WindowsFeature Web-Static-Content { Name = 'Web-Static-Content'; Ensure = 'Present' }
	WindowsFeature Web-Default-Doc { Name = 'Web-Default-Doc'; Ensure = 'Present' }
	WindowsFeature Web-Dir-Browsing { Name = 'Web-Dir-Browsing'; Ensure = 'Present' }
	WindowsFeature Web-Http-Errors { Name = 'Web-Http-Errors'; Ensure = 'Present' }
	WindowsFeature Web-App-Dev { Name = 'Web-App-Dev'; Ensure = 'Present' }
	WindowsFeature Web-Asp-Net { Name = 'Web-Asp-Net'; Ensure = 'Present' }
	WindowsFeature Web-Net-Ext { Name = 'Web-Net-Ext'; Ensure = 'Present' }
	WindowsFeature Web-ISAPI-Ext { Name = 'Web-ISAPI-Ext'; Ensure = 'Present' }
	WindowsFeature Web-ISAPI-Filter { Name = 'Web-ISAPI-Filter'; Ensure = 'Present' }
	WindowsFeature Web-Health { Name = 'Web-Health'; Ensure = 'Present' }
	WindowsFeature Web-Http-Logging { Name = 'Web-Http-Logging'; Ensure = 'Present' }
	WindowsFeature Web-Log-Libraries { Name = 'Web-Log-Libraries'; Ensure = 'Present' }
	WindowsFeature Web-Request-Monitor { Name = 'Web-Request-Monitor'; Ensure = 'Present' }
	WindowsFeature Web-Http-Tracing { Name = 'Web-Http-Tracing'; Ensure = 'Present' }
	WindowsFeature Web-Security { Name = 'Web-Security'; Ensure = 'Present' }
	WindowsFeature Web-Basic-Auth { Name = 'Web-Basic-Auth'; Ensure = 'Present' }
	WindowsFeature Web-Windows-Auth { Name = 'Web-Windows-Auth'; Ensure = 'Present' }
	WindowsFeature Web-Filtering { Name = 'Web-Filtering'; Ensure = 'Present' }
	WindowsFeature Web-Digest-Auth { Name = 'Web-Digest-Auth'; Ensure = 'Present' }
	WindowsFeature Web-Performance { Name = 'Web-Performance'; Ensure = 'Present' }
	WindowsFeature Web-Stat-Compression { Name = 'Web-Stat-Compression'; Ensure = 'Present' }
	WindowsFeature Web-Dyn-Compression { Name = 'Web-Dyn-Compression'; Ensure = 'Present' }
	WindowsFeature Web-Mgmt-Tools { Name = 'Web-Mgmt-Tools'; Ensure = 'Present' }
	WindowsFeature Web-Mgmt-Console { Name = 'Web-Mgmt-Console'; Ensure = 'Present' }
	WindowsFeature Web-Mgmt-Compat { Name = 'Web-Mgmt-Compat'; Ensure = 'Present' }
	WindowsFeature Web-Metabase { Name = 'Web-Metabase'; Ensure = 'Present' }
	WindowsFeature Application-Server { Name = 'Application-Server'; Ensure = 'Present' }
	WindowsFeature AS-Web-Support { Name = 'AS-Web-Support'; Ensure = 'Present' }
	WindowsFeature AS-TCP-Port-Sharing { Name = 'AS-TCP-Port-Sharing'; Ensure = 'Present' }
	WindowsFeature AS-WAS-Support { Name = 'AS-WAS-Support'; Ensure = 'Present' }
	WindowsFeature AS-HTTP-Activation { Name = 'AS-HTTP-Activation'; Ensure = 'Present' }
	WindowsFeature AS-TCP-Activation { Name = 'AS-TCP-Activation'; Ensure = 'Present' }
	WindowsFeature AS-Named-Pipes { Name = 'AS-Named-Pipes'; Ensure = 'Present' }
	WindowsFeature AS-Net-Framework { Name = 'AS-Net-Framework'; Ensure = 'Present' }
	WindowsFeature WAS { Name = 'WAS'; Ensure = 'Present' }
	WindowsFeature WAS-Process-Model { Name = 'WAS-Process-Model'; Ensure = 'Present' }
	WindowsFeature WAS-NET-Environment { Name = 'WAS-NET-Environment'; Ensure = 'Present' }
	WindowsFeature WAS-Config-APIs { Name = 'WAS-Config-APIs'; Ensure = 'Present' }
	WindowsFeature Web-Lgcy-Scripting { Name = 'Web-Lgcy-Scripting'; Ensure = 'Present' }
	WindowsFeature Windows-Identity-Foundation { Name = 'Windows-Identity-Foundation'; Ensure = 'Present' }
	WindowsFeature Server-Media-Foundation { Name = 'Server-Media-Foundation'; Ensure = 'Present' }
	WindowsFeature Xps-Viewer { Name = 'Xps-Viewer'; Ensure = 'Present' }
}
