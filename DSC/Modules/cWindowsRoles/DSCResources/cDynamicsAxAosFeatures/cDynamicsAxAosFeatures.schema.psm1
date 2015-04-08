Configuration cDynamicsAxAosFeatures {
	    param ( 
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
        [ValidateScript({Test-Path $_})]
		[string] $Source
    )
	
	WindowsFeature NET-Framework-Core { Name = 'NET-Framework-Core'; Ensure = 'Present'; Source = $Source }
	WindowsFeature Windows-Identity-Foundation { Name = 'Windows-Identity-Foundation'; Ensure = 'Present'; Source = $Source }
}
