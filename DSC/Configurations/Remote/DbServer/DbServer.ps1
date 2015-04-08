. .\DbServerDsc.ps1

$Share = '\\ServerName\DSC\APP'

$configData = 
@{
	AllNodes = 
	@(
		@{
		#--------------------------------
		# Computer Configuration
		#------------------------------------------------------------------
			# Computer Configuration
			NodeName = '*'
			DomainDnsName = 'core.domain.com'
			TimeZone = 'Eastern Standard Time'
			Gateway = '192.168.0.1'
			DnsAddress = @('192.168.0.100','192.168.0.1')
			FirewallDomainEnsure = 'Absent'
			FirewallPrivateEnsure = 'Present'
			FirewallPublicEnsure = 'Present'
		
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
		
		}
		@{     
			NodeName = 'DbServer01'
			IPAddress = '192.168.0.200'
            OctoRoles = @('DatabaseServer')
		}
	) 
}


$path = '.\DSC'
DbServerDsc -ConfigurationData $configData -OutputPath $path
	
