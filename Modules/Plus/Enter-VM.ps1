function Enter-VM {
	param(
		[Parameter(Mandatory=$false,Position=0,ValueFromPipeline=$true)] $VM,
		
		[Parameter(Mandatory=$false,Position=1,ValueFromPipeline=$false)]
		[String[]] $Name
	)
	
	if ($VM -and $Name) { throw 'Invalid argument' }
	
	if ($VM) {
		try {	vmconnect localhost $VM.name }
		catch { throw "error connecting to $host" }
	}
	
	if ($Name) {
		try {	vmconnect localhost $Name }
		catch { throw "error connecting to $host" }
	}
}