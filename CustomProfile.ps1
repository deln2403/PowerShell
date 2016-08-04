

$env:hosts = Join-Path ([System.Environment]::SystemDirectory) 'drivers\etc\hosts'

Import-Module Plus
Import-Module ThirdParty

function prompt {
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
    if ($currentPrincipal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )) {
      Write-Host -nonewline -foregroundcolor GRAY $(Get-Location).toString() 
	    Write-Host -nonewline -foregroundcolor RED '>>'
    }
    else {
	    Write-Host -nonewline -foregroundcolor GRAY $(Get-Location).toString()
	    Write-Host -nonewline -foregroundcolor YELLOW '>>'
    }
    return ' '  
}


function ipa { ipconfig /all | more }
function Enable-StrictMode { Set-StrictMode -Version Latest }
function Disable-StrictMode { Set-StrictMode -Off }
function New-Guid { ([guid]::newguid()).guid }
function Restart-WMI { Get-Service | ? Name -eq 'Winmgmt' | Restart-Service -force }
function Navigate-Previous { Set-Location $PreviousLocation }
function Navigate-Desktop { cd '~\Desktop' }
function Navigate-Download { cd '~\Downloads' }
function Navigate-Back { cd .. }
function Flush-Dns { Invoke-command -ScriptBlock { ipconfig '/flushdns' } } 

Set-Alias prev		Navigate-Previous
Set-Alias godesk	Navigate-Desktop
Set-Alias godown  	Navigate-Download
Set-Alias back		Navigate-Back
Set-Alias ih        Invoke-History
Set-Alias Get-Up    Get-UnifiedPath
Set-Alias so        Select-Object
Set-Alias push      Push-Location
Set-Alias pop       Pop-Location
Set-Alias gh        Get-History
Set-Alias ip        ipconfig
Set-Alias vi        vim
Set-Alias l         Get-ChildItem
Set-Alias n++       'notepad++.exe'
Set-Alias reader    'C:\Program Files (x86)\Adobe\Reader 11.0\Reader\AcroRd32.exe'
Set-Alias word 		'C:\Program Files (x86)\Microsoft Office\Office15\WINWORD.exe'
Set-Alias excel 	'C:\Program Files (x86)\Microsoft Office\Office15\EXCEL.exe'

Set-Location ~
