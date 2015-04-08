Configuration IPAddress {
	Param (
		[parameter(
      Mandatory=$true,
      ValueFromPipeline=$false,
      Position=0)]
		[ValidateNotNullOrEmpty()]
		[Alias('IP')]
		[string] $IPAddress
	)
	
	Import-DscResource -Module xNetworking
	
	Node localhost {
		xIPAddress IPAddress {
			IPAddress = $IPAddress
			InterfaceAlias = 'Ethernet'
			SubnetMask = 24
			AddressFamily = 'IPV4'
		}
	}
}

