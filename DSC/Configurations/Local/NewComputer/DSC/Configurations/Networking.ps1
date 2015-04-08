Configuration Networking {
	Param (
		[parameter(
      Mandatory=$true,
      ValueFromPipeline=$false,
      Position=0)]
		[ValidateNotNullOrEmpty()]
		[Alias('IP')]
		[string] $IPAddress,
		
		[parameter(
      Mandatory=$true,
      ValueFromPipeline=$false,
      Position=1)]
		[ValidateNotNullOrEmpty()]
		[Alias('GW')]
		[string] $DefaultGateway,
		
		[parameter(
      Mandatory=$true,
      ValueFromPipeline=$false,
      Position=2)]
		[ValidateNotNullOrEmpty()]
		[Alias('DNS')]
		[string[]] $DnsAddress,
		
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=3)]
		[Alias('Interface')]
		[ValidateNotNullOrEmpty()]
		[string] $InterfaceAlias = 'Ethernet',
		
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=4)]
		[int] $SubnetMask = 16,
		
		[parameter(
      Mandatory=$false,
      ValueFromPipeline=$false,
      Position=5)]
		[ValidateSet('IPv4','IPv6')]
		[string] $AddressFamily = 'IPv4'
	)

	Import-DscResource -Module xNetworking

	Node localhost {
		xIPAddress IPAddress 	{
			IPAddress  = $IPAddress
			InterfaceAlias = $InterfaceAlias
			DefaultGateway = $DefaultGateway
			SubnetMask  = $SubnetMask
			AddressFamily  = $AddressFamily
		}
				
		xDNSServerAddress DNSAddress {
			InterfaceAlias = $InterfaceAlias
			Address = $DnsAddress
			AddressFamily  = $AddressFamily
			DependsOn = '[xIPAddress]IPAddress'
		}
	}
} 
