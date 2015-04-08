Configuration ComputerDomain { 
	Param ( 
		[Parameter(Mandatory)]
		[string]$MachineName, 

		[Parameter(Mandatory)]
		[string]$DomainDnsName,

		[Parameter(Mandatory)]
		[pscredential]$Credential
	) 
 
	Import-DscResource -Module xComputerManagement 

	Node localhost { 
		xComputer JoinDomain { 
			Name          = $MachineName  
			DomainName    = $DomainDnsName 
			Credential    = $Credential
		}
	}
} 
