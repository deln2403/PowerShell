

$env:WindowsLockScreenPath = 'HKLM:SOFTWARE\Policies\Microsoft\Windows\Personalization'

function Get-WindowsTenLockScreen {
	switch ((Get-ItemProperty $env:WindowsLockScreenPath).NoLockScreen) {
		1  {return $false}
		default {return $true}
	}
}


function Enable-WindowsTenLockScreen {
	if (Get-WindowsTenLockScreen -eq $false) {
		Set-ItemProperty -Path $env:WindowsLockScreenPath -Name 'NoLockScreen' -value 0
		Write-Warning "Reboot for change to take effect"
	}
}

function Disable-WindowsTenLockScreen {
	if (Get-WindowsTenLockScreen -eq $true) {
		Set-ItemProperty -Path $env:WindowsLockScreenPath -Name 'NoLockScreen' -value 1
		Write-Warning "Reboot for change to take effect"
	}
}