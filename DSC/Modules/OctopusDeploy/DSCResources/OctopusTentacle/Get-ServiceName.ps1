function Get-ServiceName {
    param ( 
		[Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $InstanceName # e.g. 'Tentacle'
    )

    if ($InstanceName -eq 'Tentacle') {
        return "$ServiceBaseName Tentacle"
    }
	else {
		return "$ServiceBaseName Tentacle: $InstanceName"
	}
}

