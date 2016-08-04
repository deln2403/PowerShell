
FUNCTION Disable-ProxyState() {
		
	# Toggle proxy state.
	Write-Host 'DISABLING user''s proxy settings...';
	Set-ItemProperty 'HKLM:Software\Microsoft\Windows\CurrentVersion\Internet Settings' -name ProxyEnable -value 0;
	Set-ItemProperty 'HKLM:Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings' -name ProxyEnable -value 0;
	# Start a new/hidden IE process temporarily.
        Start-HiddenIEProcess;
	Write-Host '[DONE]';
} 


FUNCTION Get-USB()
{
    $state = get-itemproperty 'HKLM:SYSTEM\CurrentControlSet\Services\USBSTOR' -name Start 
}

