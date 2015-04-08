Configuration PullServer {
	PARAM (
		[string[]]$ComputerName = "$($env:COMPUTERNAME).$($env:USERDNSDOMAIN)"
	)

	Import-DSCResource -ModuleName xPSDesiredStateConfiguration

	Node $ComputerName 	{
	
		WindowsFeature DscServiceFeature 	{
			Ensure = 'Present'
			Name   = 'DSC-Service'
		}

		xDscWebService PSDSCPullServer {
			Ensure                  = 'Present'
			EndpointName            = 'PsDscPullServer'
			Port                    = 8080
			PhysicalPath            = "$($env:SystemDrive)\inetpub\wwwroot\PsDscPullServer"
			CertificateThumbPrint   = 'AllowUnencryptedTraffic'
			ModulePath              = "D:\Support\DSC\Modules"
			#ModulePath              = "$($env:PROGRAMFILES)\WindowsPowerShell\DscService\Modules"
			ConfigurationPath       = "D:\Support\DSC\Configurations"
			#ConfigurationPath       = "$($env:PROGRAMFILES)\WindowsPowerShell\DscService\Configurations"
			State                   = 'Started'
			DependsOn               = '[WindowsFeature]DSCServiceFeature'
		}

		xDscWebService PSDSCComplianceServer {
			Ensure                  = 'Present'
			EndpointName            = 'PsDscComplianceServer'
			Port                    = 9080
			PhysicalPath            = "$($env:SystemDrive)\inetpub\wwwroot\PsDscComplianceServer"
			CertificateThumbPrint   = 'AllowUnencryptedTraffic'
			State                   = 'Started'
			IsComplianceServer      = $true
			DependsOn               = ('[WindowsFeature]DSCServiceFeature','[xDSCWebService]PSDSCPullServer')
		}
	}
}

$path = '.\DSC'
PullServer -OutputPath $path 
Start-DscConfiguration -Path $path -verbose -wait
