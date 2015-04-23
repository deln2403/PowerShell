Configuration cDynamicsAxEntPortalFeatures {
	param ( 
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
        [ValidateScript({Test-Path $_})]
		[string] $Source
    )
	
	# Microsoft Chart Controls for Microsoft .NET Framework 3.5
	# http://www.microsoft.com/en-us/download/details.aspx?id=14422
	Package Sql2008R2Adom { 
		Name = 'Microsoft Chart Controls for Microsoft .NET Framework 3.5'
		ProductId = '41785C66-90F2-40CE-8CB5-1C94BFC97280'
		Path = "$Source\MSChart.exe"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# Microsoft Report Viewer 2010 Redistributable Package
	# http://www.microsoft.com/en-us/download/details.aspx?id=6442
	Package ReportVwr2010 { 
		Name = 'Microsoft ReportViewer 2010 Redistributable'
		ProductId = 'C19B3EB6-B54C-3204-A4DF-88432E0C79F7'
		Path = "$Source\ReportViewer.exe" 
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# Open XML SDK 2.0 for Microsoft Office
	# http://www.microsoft.com/en-us/download/details.aspx?id=5124
	Package OXS2 { 
		Name = 'Open XML SDK 2.0 for Microsoft Office'
		ProductId = '171D8D76-3F05-455A-A8AF-C561C2679905'
		Path = "$Source\OpenXMLSDKv2.msi"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# Open XML SDK 2.0 Productivity Tool for Microsoft Office
	# http://www.microsoft.com/en-us/download/details.aspx?id=5124
	Package OXS2T { 
		Name = 'Open XML SDK 2.0 Productivity Tool for Microsoft Office'
		ProductId = 'DEB1CE7F-5821-4E1C-ADED-744F52052E4A'
		Path = "$Source\OpenXMLSDKTool.msi"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# Microsoft SQL Server Analysis Management Objects
	# http://download.microsoft.com/download/B/6/3/B63CAC7F-44BB-41FA-92A3-CBF71360F022/1033/x64/SQLSERVER2008_ASAMO10.msi
	Package SqlAmo { 
		Name = 'Microsoft SQL Server Analysis Management Objects'
		ProductId = '1D1B79DF-69ED-424E-B881-9F7C89D6524F'
		Path = "$Source\SQLSERVER2008_ASAMO10.msi"
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
