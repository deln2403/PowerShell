Configuration PsModules {
	param (
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		$Source,

		[Parameter(Mandatory=$false)]
		$Destination = 'C:\Program Files\WindowsPowerShell\Modules',
		
		[Parameter(Mandatory=$false)]
		[PSCredential] $Credential
	)

	Node localhost {
		File DSCResourceFolder {
			Ensure  				= 'Present'
			Type 						= 'Directory'
			SourcePath 			= $Source
			DestinationPath = $Destination
			Recurse 				= $true
			Credential 			= $Credential
		}
	}
}
 
