function Get-DscRemoteGuid {
	[Cmdletbinding()]
    param( [string] $ComputerName )

    if ($ComputerName) {
        Invoke-Command  -ComputerName $ComputerName `
            -ScriptBlock { (Get-DscLocalConfigurationManager).ConfigurationID }
    }
    else { (Get-DscLocalConfigurationManager).ConfigurationID }
}
