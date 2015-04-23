function Get-ServiceName {
    param ( 
		[Parameter(Mandatory=$false)]
        [string] $InstanceName = 'Tentacle' # e.g. 'Tentacle'
    )

    if ($InstanceName -eq 'Tentacle') { return "$ServiceBaseName Tentacle" }
	else { return "$ServiceBaseName Tentacle: $InstanceName" }
}

