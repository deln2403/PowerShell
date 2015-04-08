. .\PullClientDsc.ps1


$configData = 
@{
	AllNodes = 
	@(
		@{ 
			NodeName = '*'
			ConfigurationFrequencyMins = 15
			PullServerUrl = 'http://servername.core.domain.com:8080/PsDscPullServer.svc'
			RebootNodeIfNeeded = $true
		}
		@{     
			NodeName = 'SpServer01'
			Guid = '189a4113-d0d0-4329-8b35-d8a383e99f25'
		}
        @{
            NodeName = 'DbServer01'
            Guid = '695900d3-1dfe-41bc-b6bd-44d679283f0e'
        }
        @{
            NodeName = 'AxServer01'
            Guid = '85ded0e3-cab9-4aff-bb87-72935140a274'
        }
        @{
            NodeName = 'WsusServer01'
            Guid = 'e296082f-6a91-415f-a657-ebb8f1262d45'
        }
	) 
}

$path = '.\DSC'
PullClient -ConfigurationData $configData -OutputPath $path

Write-Host "`n`n"
Write-Host "Set-DSCLocalConfigurationManager -Path $path -Verbose -ComputerName XYZ"
