
$ApplicationName = 'Octopus Deploy Tentacle'
$ServiceBaseName = 'OctopusDeploy'
$DefaultInstallPath = "${env:ProgramFiles}\Octopus Deploy\Tentacle"
$Tentacle = 'tentacle.exe'

Get-ChildItem -Path $PSScriptRoot\*.ps1 | Foreach-Object{ . $_.FullName }

Export-ModuleMember -function *