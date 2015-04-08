. .\AxServerDsc.ps1

$Share = '\\Servername\DSC\APP'
$axPrePath = "$Share\Microsoft\DynamicsAX2012R3\Prerequisites"

$configData = 
@{
	AllNodes = 
	@(
		@{ 
		#--------------------------------
		# Computer Configuration
		#------------------------------------------------------------------
			NodeName = '*'
			DomainDnsName = 'core.domain.com'
			TimeZone = 'Eastern Standard Time'
			Gateway = '192.168.0.1'
			DnsAddress = @('192.168.0.100','192.168.0.1')
			FirewallDomainEnsure = 'Absent'
			FirewallPrivateEnsure = 'Present'
			FirewallPublicEnsure = 'Present'
			
		#--------------------------------
		# Windows Features
		#------------------------------------------------------------------
			FeaturesSourcePath = "$Share\Microsoft\WindowsServer2012R2\sources\sxs"

		#--------------------------------
		# Core Packages
		#------------------------------------------------------------------
			# 7-Zip
            PkgSevenZipName = '7-Zip 9.38 (x64 edition)'
            PkgSevenZipProductId = '23170F69-40C1-2702-0938-000001000000'
            PkgSevenZipEnsure = 'Present'
            PkgSevenZipPath = "$Share\Core\7z938-x64.msi"
 
			# Octopus Deploy Tentacle
            PkgOctoName = 'Octopus Deploy Tentacle' 
            PkgOctoProductId = '46329534-FA75-4B45-9B71-8758FB4B5B3E'
            PkgOctoEnsure = 'Present'
            PkgOctoPath = "$Share\OctopusDeploy\Client\Octopus.Tentacle.2.6.4.951-x64.msi"
			
			# Octopus Configuration
            OctoTentacleState = 'Started'
            OctoTentacleName = 'Tentacle'
            OctoApiKey = '731B8E494291A291067DB8B2AA6DB0B5A3A7A1F9'
            OctoServerUrl =  'http://octopus.core.domain.com'
            OctoListenPort = 10933
            OctoDefaultApplicationDirectory = 'C:\Octopus\Applications'
            OctoEnvironments = @('Dev')

		#--------------------------------
		# AX AOS Prerequisites
		#------------------------------------------------------------------		
			# Microsoft Chart Controls for Microsoft .NET Framework 3.5
			# http://www.microsoft.com/en-us/download/details.aspx?id=14422
			PkgMsChartName = 'Microsoft Chart Controls for Microsoft .NET Framework 3.5'
			PkgMsChartProductId = '41785C66-90F2-40CE-8CB5-1C94BFC97280'
            PkgMsChartPath = "$axPrePath\MSChart.exe"
			PkgMsChartArgs = '/q'
			
			# Open XML SDK 2.0 for Microsoft Office
			# http://www.microsoft.com/en-us/download/details.aspx?id=5124
			PkgOXS2Name = 'Open XML SDK 2.0 for Microsoft Office'
			PkgOXS2ProductId = '171D8D76-3F05-455A-A8AF-C561C2679905'
            PkgOXS2Path = "$axPrePath\OpenXMLSDKv2.msi"
			PkgOXS2Args = '/q'
			
			# Open XML SDK 2.0 Productivity Tool for Microsoft Office
			# http://www.microsoft.com/en-us/download/details.aspx?id=5124
			PkgOXS2TName = 'Open XML SDK 2.0 Productivity Tool for Microsoft Office'
			PkgOXS2TProductId = 'DEB1CE7F-5821-4E1C-ADED-744F52052E4A'
            PkgOXS2TPath = "$axPrePath\OpenXMLSDKTool.msi"
			PkgOXS2TArgs = '/q'
			
			# Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.17
			# http://www.microsoft.com/en-us/download/details.aspx?id=5582
			PkgVcredist2008x86Name = 'Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.17'
			PkgVcredist2008x86ProductId = '9A25302D-30C0-39D9-BD6F-21E6EC160475'
			PkgVcredist2008x86Path = "$axPrePath\vcredist_2008_x86.exe"
			PkgVcredist2008x86Args = '/q'
			
			# Microsoft Visual C++ 2008 SP1 Redistributable Package (x64)
			# http://www.microsoft.com/en-us/download/details.aspx?id=2092
			PkgVcredist2008x64Name = 'Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.17'
			PkgVcredist2008x64ProductId = '8220EEFE-38CD-377E-8595-13398D740ACE'
            PkgVcredist2008x64Path = "$axPrePath\vcredist_2008_x64.exe"
			PkgVcredist2008x64Args = '/q'
						
			# Microsoft Visual C++ 2010  x86 Redistributable - 10.0.30319
			# http://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14A-475AB85EEF6E/vcredist_x86.exe
			PkgVcredist2010x86Name = 'Microsoft Visual C++ 2010  x86 Redistributable - 10.0.30319'
			PkgVcredist2010x86ProductId = '196BB40D-1578-3D01-B289-BEFC77A11A1E'
            PkgVcredist2010x86Path = "$axPrePath\vcredist_2010_x86.exe"
			PkgVcredist2010x86Args = '/q'
			
			# Microsoft Visual C++ 2010  x64 Redistributable - 10.0.30319
			# http://download.microsoft.com/download/3/2/2/3224B87F-CFA0-4E70-BDA3-3DE650EFEBA5/vcredist_x64.exe
			PkgVcredist2010x64Name = 'Microsoft Visual C++ 2010  x64 Redistributable - 10.0.30319'
			PkgVcredist2010x64ProductId = 'DA5E371C-6333-3D8A-93A4-6FD5B20BCC6E'
            PkgVcredist2010x64Path = "$axPrePath\vcredist_2010_x64.exe"
			PkgVcredist2010x64Args = '/q'
			
			# Microsoft Visual C++ 2012 Redistributable (x86) - 11.0.61030
			# http://www.microsoft.com/en-us/download/details.aspx?id=30679
			PkgVcredist2012x86Name = 'Microsoft Visual C++ 2012 Redistributable (x86) - 11.0.61030'
			PkgVcredist2012x86ProductId = '33d1fd90-4274-48a1-9bc1-97e33d9c2d6f'
			PkgVcredist2012x86Path = "$axPrePath\vcredist_2012_x86.exe"
			PkgVcredist2012x86Args = '/q'
			
			# Microsoft Visual C++ 2012 Redistributable (x64) - 11.0.61030
			# http://www.microsoft.com/en-us/download/details.aspx?id=30679
			PkgVcredist2012x64Name = 'Microsoft Visual C++ 2012 Redistributable (x64) - 11.0.61030'
			PkgVcredist2012x64ProductId = 'ca67548a-5ebe-413a-b50c-4b9ceb6d66c6'
			PkgVcredist2012x64Path = "$axPrePath\vcredist_2012_x64.exe"
			PkgVcredist2012x64Args = '/q'
			
			# Microsoft SQL Server 2012 Native Client
			# http://download.microsoft.com/download/F/E/D/FEDB200F-DE2A-46D8-B661-D019DFE9D470/ENU/x64/sqlncli.msi
			PkgSqlNcName = 'Microsoft SQL Server 2012 Native Client '
			PkgSqlNcProductId = '49D665A2-4C2A-476E-9AB8-FCC425F526FC'
            PkgSqlNcPath = "$axPrePath\sqlncli.msi"
			PkgSqlNcArgs = '/q IACCEPTSQLNCLILICENSETERMS=YES'
			
			# SharePoint Server 2013 Client Components SDK
			# http://www.microsoft.com/en-us/download/details.aspx?id=35585
			PkgSpClientName = 'SharePoint Client Components'
			PkgSpClientProductId = '95150003-1163-0409-1000-0000000FF1CE'
            PkgSpClientPath = "$axPrePath\sharepointclientcomponents_x64.msi"
			PkgSpClientArgs = '/q'
			
			# Microsoft Report Viewer 2010 Redistributable Package
			# http://www.microsoft.com/en-us/download/details.aspx?id=6442
			PkgReportVwr2010Name = 'Microsoft ReportViewer 2010 Redistributable'
			PkgReportVwr2010ProductId = 'C19B3EB6-B54C-3204-A4DF-88432E0C79F7'
            PkgReportVwr2010Path = "$axPrePath\ReportViewer.exe"
			PkgReportVwr2010Args = '/q'
			
			# Microsoft SQL Server Analysis Management Objects
			# http://download.microsoft.com/download/B/6/3/B63CAC7F-44BB-41FA-92A3-CBF71360F022/1033/x64/SQLSERVER2008_ASAMO10.msi
			PkgSqlAmoName = 'Microsoft SQL Server Analysis Management Objects'
			PkgSqlAmoProductId = '1D1B79DF-69ED-424E-B881-9F7C89D6524F'
            PkgSqlAmoPath = "$axPrePath\SQLSERVER2008_ASAMO10.msi"
			PkgSqlAmoArgs = '/q'
			
		}
		@{     
			NodeName = 'AXSERVER01'
			IPAddress = '192.168.0.205'
			OctoRoles = @('Core','AxAosNode')
        }
	) 
}


$path = '.\DSC'
AxServerDsc -ConfigurationData $configData -OutputPath $path
	
