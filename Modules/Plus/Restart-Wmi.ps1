

function Restart-WMI { 
	Get-Service | ? Name -eq 'Winmgmt' | Restart-Service -force 
}