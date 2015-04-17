. .\BasicServerDsc.ps1

$Share = '\\ServerName\DSC\APP'

$configData = 
@{
	AllNodes = 
	@(
		@{ 
			# Computer Configuration
			NodeName = '*'
			DomainDnsName = 'core.domain.come'
			TimeZone = 'Eastern Standard Time'
			Gateway = '192.168.0.1'
			DnsAddress = @('192.168.0.100','192.168.0.1')

			# Package 7-Zip
            SevenZipName = '7-Zip 9.38 (x64 edition)'
            SevenZipProductId = '23170F69-40C1-2702-0938-000001000000'
            SevenZipEnsure = 'Present'
            SevenZipPath = "$Share\Core\7z938-x64.msi"
 
			# Package Octopus Deploy Tentacle
            OctoName = 'Octopus Deploy Tentacle' 
            OctoProductId = '46329534-FA75-4B45-9B71-8758FB4B5B3E'
            OctoEnsure = 'Present'
            OctoPath = "$Share\OctopusDeploy\Octopus.Tentacle.2.6.4.951-x64.msi"
			
			# Octopus
            OctoTentacleState = 'Started'
            OctoTentacleName = 'Tentacle'
            OctoApiKey = '731B8E494291A291067DB8B2AA6DB0B5A3A7A1F9'
            OctoServerUrl =  'http://octopus.core.domain.com'
            OctoListenPort = 10933
            OctoDefaultApplicationDirectory = 'C:\Octopus\Applications'
            OctoEnvironments = @('Dev')  
		}
		@{     
			NodeName = 'Server01'
			IPAddress = '192.168.0.200'
            OctoRoles = @('DatabaseServer')
		}
		@{     
			NodeName = 'Server01'
			IPAddress = '192.168.0.205'
            OctoRoles = @('AxAosNode')
        }
	) 
}


$path = '.\DSC'
BasicServerDsc -ConfigurationData $configData -OutputPath $path
	
