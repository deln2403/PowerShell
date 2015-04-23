
$DefaultInstallPath = 'C:\Program Files\Octopus Deploy\Tentacle'
$ServiceBaseName = 'OctopusDeploy'
$Tentacle = 'tentacle.exe'

Get-ChildItem -Path $PSScriptRoot\*.ps1 | Foreach-Object{ . $_.FullName }

Export-ModuleMember -function *