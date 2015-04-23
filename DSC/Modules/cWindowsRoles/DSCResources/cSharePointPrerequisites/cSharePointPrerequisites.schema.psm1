Configuration cSharePointPrerequisites {
	param ( 
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
        [ValidateScript({Test-Path $_})]
		[string] $Source
    )
	
	# AppFabric 1.1 for Windows Server
	Package AppFabric1Dot1 { 
		Name = 'AppFabric 1.1 for Windows Server'
		ProductId = '96E70525-4CD1-4920-9C0B-91055C79A962'
		Path = "$Source\WindowsServerAppFabricSetup_x64.exe"
		Arguments = '/i CacheClient","CachingService","CacheAdmin /gac'
		Ensure = 'Present'
	}
	
	# Windows Server AppFabric v1.1 CU1[KB 2671763]LDR
	Package AppFabric1Dot1Cu1 { 
		Name = 'Windows Server AppFabric v1.1 CU1[KB 2671763]LDR'
		ProductId = ''
		Path = "$Source\AppFabric1.1-RTM-KB2671763-x64-ENU.exe"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# Microsoft Identity Extensions
	Package MicrosoftIdentityExtensions { 
		Name = 'Microsoft Identity Extensions'
		ProductId = 'F99F24BF-0B90-463E-9658-3FD2EFC3C991'
		Path = "$Source\MicrosoftIdentityExtensions-64.msi"
		Arguments = '/q'
		Ensure = 'Present'
	}
		
	# Microsoft Sync Framework Runtime v1.0 SP1 (x64)
	Package MicrosoftSyncFrameworkRuntimev1SP1 { 
		Name = 'Microsoft Sync Framework Runtime v1.0 SP1 (x64)'
		ProductId = '8438EC02-B8A9-462D-AC72-1B521349C001'
		Path = "$Source\Synchronization.msi"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# WCF Data Services 5.0 (OData v3)
	Package WCFDataServices5dot0ODatav3 { 
		Name = 'WCF Data Services 5.0 (OData v3)'
		ProductId = 'ad60454d-9edf-4100-8342-06830732be63'
		Path = "$Source\WcfDataServices.exe"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# WCF Data Services 5.6 Tools
	Package WCFDataServices5dot6Tools { 
		Name = 'WCF Data Services 5.6 Tools'
		ProductId = '46910786-E4AC-41E4-A4A0-C086EA85242D'
		Path = "$Source\WcfDataServices56.exe"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# Active Directory Rights Management Services Client 2.0
	Package ActiveDirectoryRightsManagementServicesClient2dot0 { 
		Name = 'Active Directory Rights Management Services Client 2.0'
		ProductId = 'C293A044-3603-4CA3-B8FC-BA3F86F9F169'
		Path = "$Source\setup_msipc_x64.msi"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# Microsoft SQL Server 2012 Native Client
	Package MicrosofSQLServer2012NativeClient { 
		Name = 'Microsoft SQL Server 2012 Native Client '
		ProductId = '49D665A2-4C2A-476E-9AB8-FCC425F526FC'
		Path = "$Source\sqlncli.msi"
		Arguments = '/q IACCEPTSQLNCLILICENSETERMS=YES'
		Ensure = 'Present'
	}

	
}
