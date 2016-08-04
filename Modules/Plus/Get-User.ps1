FUNCTION Get-User() {
	$c = Get-Credential $env:username\$env:userdomain
	return $c
}
