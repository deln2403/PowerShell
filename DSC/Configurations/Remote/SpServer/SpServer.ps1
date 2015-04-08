. .\SpServerDsc.ps1

$Share = '\\ServerName\DSC\APP'
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
            OctoServerUrl =  'http://octopus.core.domain.copm'
            OctoListenPort = 10933
            OctoDefaultApplicationDirectory = 'C:\Octopus\Applications'
            OctoEnvironments = @('Dev')

		#--------------------------------
		# AX EP Prerequisites
		#------------------------------------------------------------------				
			# Microsoft SQL Server 2008 R2 ADOMD.NET
			# http://download.microsoft.com/download/B/6/3/B63CAC7F-44BB-41FA-92A3-CBF71360F022/1033/x64/SQLSERVER2008_ASADOMD10.msi
			PkgSql2008R2AdomName = 'Microsoft SQL Server 2008 R2 Native Client'
			PkgSql2008R2AdomProductId = 'DE81CA12-BA88-4D4F-BAF2-12DD94A9EF35'
            PkgSql2008R2AdomPath = "$axPrePath\SQLSERVER2008_ASADOMD10.msi"
			PkgSql2008R2AdomArgs = '/q'
			
			# Microsoft Chart Controls for Microsoft .NET Framework 3.5
			# http://www.microsoft.com/en-us/download/details.aspx?id=14422
			PkgMsChartName = 'Microsoft Chart Controls for Microsoft .NET Framework 3.5'
			PkgMsChartProductId = '41785C66-90F2-40CE-8CB5-1C94BFC97280'
            PkgMsChartPath = "$axPrePath\MSChart.exe"
			PkgMsChartArgs = '/q'
			
			# Microsoft Report Viewer 2010 Redistributable Package
			# http://www.microsoft.com/en-us/download/details.aspx?id=6442
			PkgReportVwr2010Name = 'Microsoft ReportViewer 2010 Redistributable'
			PkgReportVwr2010ProductId = 'C19B3EB6-B54C-3204-A4DF-88432E0C79F7'
            PkgReportVwr2010Path = "$axPrePath\ReportViewer.exe"
			PkgReportVwr2010Args = '/q'
			
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
			
			# Microsoft SQL Server Analysis Management Objects
			# http://download.microsoft.com/download/B/6/3/B63CAC7F-44BB-41FA-92A3-CBF71360F022/1033/x64/SQLSERVER2008_ASAMO10.msi
			PkgSqlAmoName = 'Microsoft SQL Server Analysis Management Objects'
			PkgSqlAmoProductId = '1D1B79DF-69ED-424E-B881-9F7C89D6524F'
            PkgSqlAmoPath = "$axPrePath\SQLSERVER2008_ASAMO10.msi"
			PkgSqlAmoArgs = '/q'
		}
		@{     
			NodeName = 'SpServer01'
			IPAddress = '192.168.0.202'
            OctoRoles = @('WebServer')
		}
	) 
}


$path = '.\DSC'
SpServerDsc -ConfigurationData $configData -OutputPath $path
	
