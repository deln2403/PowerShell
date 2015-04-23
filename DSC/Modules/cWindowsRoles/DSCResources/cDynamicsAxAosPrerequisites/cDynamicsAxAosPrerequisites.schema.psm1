Configuration cDynamicsAxAosFeatures {
	param ( 
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
        [ValidateScript({Test-Path $_})]
		[string] $Source
    )
	
	# Microsoft Chart Controls for Microsoft .NET Framework 3.5
	# http://www.microsoft.com/en-us/download/details.aspx?id=14422
	Package MSChart { 
		Name = 'Microsoft Chart Controls for Microsoft .NET Framework 3.5'
		ProductId = '41785C66-90F2-40CE-8CB5-1C94BFC97280'
		Path = "$Source\MSChart.exe"
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
	
	# Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.17
	# http://www.microsoft.com/en-us/download/details.aspx?id=5582
	Package PkgVcredist2008x86Path { 
		Name = 'Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.17'
		ProductId = '9A25302D-30C0-39D9-BD6F-21E6EC160475'
		Path = "$Source\vcredist_2008_x86.exe"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# Microsoft Visual C++ 2008 SP1 Redistributable Package (x64)
	# http://www.microsoft.com/en-us/download/details.aspx?id=2092
	Package PkgVcredist2008x64Path { 
		Name = 'Microsoft Visual C++ 2008 Redistributable - x64 9.0.30729.17'
		ProductId = '8220EEFE-38CD-377E-8595-13398D740ACE'
		Path = "$Source\vcredist_2008_x64.exe"
		Arguments = '/q'
		Ensure = 'Present'
	}

	# Microsoft Visual C++ 2010  x86 Redistributable - 10.0.30319
	# http://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14A-475AB85EEF6E/vcredist_x86.exe
	Package PkgVcredist2010x86Path { 
		Name = 'Microsoft Visual C++ 2010  x86 Redistributable - 10.0.30319'
		ProductId = '196BB40D-1578-3D01-B289-BEFC77A11A1E'
		Path = "$Source\vcredist_2010_x86.exe"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# Microsoft Visual C++ 2010 x64 Redistributable - 10.0.30319
	# http://download.microsoft.com/download/3/2/2/3224B87F-CFA0-4E70-BDA3-3DE650EFEBA5/vcredist_x64.exe
	Package PkgVcredist2010x64Name { 
		Name = 'Microsoft Visual C++ 2010  x64 Redistributable - 10.0.30319'
		ProductId = 'DA5E371C-6333-3D8A-93A4-6FD5B20BCC6E'
		Path = "$Source\vcredist_2010_x64.exe"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# Microsoft Visual C++ 2012 Redistributable (x86) - 11.0.61030
	# http://www.microsoft.com/en-us/download/details.aspx?id=30679
	Package PkgVcredist2012x86Name { 
		Name = 'Microsoft Visual C++ 2012 Redistributable (x86) - 11.0.61030'
		ProductId = '33d1fd90-4274-48a1-9bc1-97e33d9c2d6f'
		Path = "$Source\vcredist_2012_x86.exe"
		Arguments = '/q'
		Ensure = 'Present'
	}
	
	# Microsoft Visual C++ 2012 Redistributable (x64) - 11.0.61030
	# http://www.microsoft.com/en-us/download/details.aspx?id=30679
	Package PkgVcredist2012x64Name { 
		Name = 'Microsoft Visual C++ 2012 Redistributable (x64) - 11.0.61030'
		ProductId = 'ca67548a-5ebe-413a-b50c-4b9ceb6d66c6'
		Path = "$Source\vcredist_2012_x64.exe"
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
	
	# SharePoint Server 2013 Client Components SDK
	# http://www.microsoft.com/en-us/download/details.aspx?id=35585
	Package SharePointClientComponents { 
		Name = 'SharePoint Client Components'
		ProductId = '95150003-1163-0409-1000-0000000FF1CE'
		Path = "$Source\sharepointclientcomponents_x64.msi"
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
	
	# Microsoft SQL Server Analysis Management Objects
	# http://download.microsoft.com/download/B/6/3/B63CAC7F-44BB-41FA-92A3-CBF71360F022/1033/x64/SQLSERVER2008_ASAMO10.msi
	Package SqlAmo { 
		Name = 'Microsoft SQL Server Analysis Management Objects'
		ProductId = '1D1B79DF-69ED-424E-B881-9F7C89D6524F'
		Path = "$Source\SQLSERVER2008_ASAMO10.msi"
		Arguments = '/q'
		Ensure = 'Present'
	}
}
