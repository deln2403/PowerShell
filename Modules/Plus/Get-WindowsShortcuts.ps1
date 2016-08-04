function Get-WindowsShortcuts {
	$collection = @()
	$collection += New-Object PSObject -Property @{ Name = 'Accessibility Controls'; Command = 'access.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Accessibility Wizard'; Command = 'accwiz' }
	$collection += New-Object PSObject -Property @{ Name = 'Add Hardware Wizard'; Command = 'hdwwiz.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Add/Remove Programs'; Command = 'appwiz.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Administrative Tools'; Command = 'control admintools' }
	$collection += New-Object PSObject -Property @{ Name = 'Adobe Acrobat (if installed)'; Command = 'acrobat' }
	$collection += New-Object PSObject -Property @{ Name = 'Adobe Designer (if installed)'; Command = 'acrodist' }
	$collection += New-Object PSObject -Property @{ Name = 'Adobe Distiller (if installed)'; Command = 'acrodist' }
	$collection += New-Object PSObject -Property @{ Name = 'Adobe ImageReady (if installed)'; Command = 'imageready' }
	$collection += New-Object PSObject -Property @{ Name = 'Adobe Photoshop (if installed)'; Command = 'photoshop' }
	$collection += New-Object PSObject -Property @{ Name = 'Automatic Updates'; Command = 'wuaucpl.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Bluetooth Transfer Wizard'; Command = 'fsquirt' }
	$collection += New-Object PSObject -Property @{ Name = 'Calculator'; Command = 'calc' }
	$collection += New-Object PSObject -Property @{ Name = 'Certificate Manager'; Command = 'certmgr.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Character Map'; Command = 'charmap' }
	$collection += New-Object PSObject -Property @{ Name = 'Check Disk Utility'; Command = 'chkdsk' }
	$collection += New-Object PSObject -Property @{ Name = 'Clipboard Viewer'; Command = 'clipbrd' }
	$collection += New-Object PSObject -Property @{ Name = 'Command Prompt'; Command = 'cmd' }
	$collection += New-Object PSObject -Property @{ Name = 'Component Services'; Command = 'dcomcnfg' }
	$collection += New-Object PSObject -Property @{ Name = 'Computer Management'; Command = 'compmgmt.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Control Panel'; Command = 'control' }
	$collection += New-Object PSObject -Property @{ Name = 'Date and Time Properties'; Command = 'timedate.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'DDE Shares'; Command = 'ddeshare' }
	$collection += New-Object PSObject -Property @{ Name = 'Device Manager'; Command = 'devmgmt.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Direct X Control Panel (If Installed)*'; Command = 'directx.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Direct X Troubleshooter'; Command = 'dxdiag' }
	$collection += New-Object PSObject -Property @{ Name = 'Disk Cleanup Utility'; Command = 'cleanmgr' }
	$collection += New-Object PSObject -Property @{ Name = 'Disk Defragment'; Command = 'dfrg.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Disk Management'; Command = 'diskmgmt.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Disk Partition Manager'; Command = 'diskpart' }
	$collection += New-Object PSObject -Property @{ Name = 'Display Properties (w/Appearance Tab Preselected)'; Command = 'control color' }
	$collection += New-Object PSObject -Property @{ Name = 'Display Properties'; Command = 'control desktop' }
	$collection += New-Object PSObject -Property @{ Name = 'Display Properties'; Command = 'desk.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Dr. Watson System Troubleshooting Utility'; Command = 'drwtsn32' }
	$collection += New-Object PSObject -Property @{ Name = 'Driver Verifier Utility'; Command = 'verifier' }
	$collection += New-Object PSObject -Property @{ Name = 'Event Viewer'; Command = 'eventvwr.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'File Signature Verification Tool'; Command = 'sigverif' }
	$collection += New-Object PSObject -Property @{ Name = 'Files and Settings Transfer Tool'; Command = 'migwiz' }
	$collection += New-Object PSObject -Property @{ Name = 'Findfast'; Command = 'findfast.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Firefox (if installed)'; Command = 'firefox' }
	$collection += New-Object PSObject -Property @{ Name = 'Folders Properties'; Command = 'control folders' }
	$collection += New-Object PSObject -Property @{ Name = 'Fonts Folder'; Command = 'fonts' }
	$collection += New-Object PSObject -Property @{ Name = 'Fonts'; Command = 'control fonts' }
	$collection += New-Object PSObject -Property @{ Name = 'Free Cell Card Game'; Command = 'freecell' }
	$collection += New-Object PSObject -Property @{ Name = 'Game Controllers'; Command = 'joy.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Group Policy Editor (XP Prof)'; Command = 'gpedit.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Hearts Card Game'; Command = 'mshearts' }
	$collection += New-Object PSObject -Property @{ Name = 'Help and Support'; Command = 'helpctr' }
	$collection += New-Object PSObject -Property @{ Name = 'HyperTerminal'; Command = 'hypertrm' }
	$collection += New-Object PSObject -Property @{ Name = 'Iexpress Wizard'; Command = 'iexpress' }
	$collection += New-Object PSObject -Property @{ Name = 'Indexing Service'; Command = 'ciadv.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Internet Connection Wizard'; Command = 'icwconn1' }
	$collection += New-Object PSObject -Property @{ Name = 'Internet Explorer'; Command = 'iexplore' }
	$collection += New-Object PSObject -Property @{ Name = 'Internet Properties'; Command = 'inetcpl.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Internet Setup Wizard'; Command = 'inetwiz' }
	$collection += New-Object PSObject -Property @{ Name = 'IP Configuration (Delete DNS Cache Contents)'; Command = 'ipconfig /flushdns' }
	$collection += New-Object PSObject -Property @{ Name = 'IP Configuration (Display Connection Configuration)'; Command = 'ipconfig /all' }
	$collection += New-Object PSObject -Property @{ Name = 'IP Configuration (Display DHCP Class ID)'; Command = 'ipconfig /showclassid' }
	$collection += New-Object PSObject -Property @{ Name = 'IP Configuration (Display DNS Cache Contents)'; Command = 'ipconfig /displaydns' }
	$collection += New-Object PSObject -Property @{ Name = 'IP Configuration (Modifies DHCP Class ID)'; Command = 'ipconfig /setclassid' }
	$collection += New-Object PSObject -Property @{ Name = 'IP Configuration (Refreshes DHCP & Re-Registers DNS)'; Command = 'ipconfig /registerdns' }
	$collection += New-Object PSObject -Property @{ Name = 'IP Configuration (Release All Connections)'; Command = 'ipconfig /release' }
	$collection += New-Object PSObject -Property @{ Name = 'IP Configuration (Renew All Connections)'; Command = 'ipconfig /renew' }
	$collection += New-Object PSObject -Property @{ Name = 'Java Control Panel (If Installed)'; Command = 'javaws' }
	$collection += New-Object PSObject -Property @{ Name = 'Java Control Panel (If Installed)'; Command = 'jpicpl32.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Keyboard Properties'; Command = 'control keyboard' }
	$collection += New-Object PSObject -Property @{ Name = 'Local Security Settings'; Command = 'secpol.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Local Users and Groups'; Command = 'lusrmgr.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Logs You Out Of Windows'; Command = 'logoff' }
	$collection += New-Object PSObject -Property @{ Name = 'Malicious Software Removal Tool'; Command = 'mrt' }
	$collection += New-Object PSObject -Property @{ Name = 'Microsoft Access (if installed)'; Command = 'access.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Microsoft Chat'; Command = 'winchat' }
	$collection += New-Object PSObject -Property @{ Name = 'Microsoft Excel (if installed)'; Command = 'excel' }
	$collection += New-Object PSObject -Property @{ Name = 'Microsoft Frontpage (if installed)'; Command = 'frontpg' }
	$collection += New-Object PSObject -Property @{ Name = 'Microsoft Movie Maker'; Command = 'moviemk' }
	$collection += New-Object PSObject -Property @{ Name = 'Microsoft Paint'; Command = 'mspaint' }
	$collection += New-Object PSObject -Property @{ Name = 'Microsoft Powerpoint (if installed)'; Command = 'powerpnt' }
	$collection += New-Object PSObject -Property @{ Name = 'Microsoft Syncronization Tool'; Command = 'mobsync' }
	$collection += New-Object PSObject -Property @{ Name = 'Microsoft Word (if installed)'; Command = 'winword' }
	$collection += New-Object PSObject -Property @{ Name = 'Minesweeper Game'; Command = 'winmine' }
	$collection += New-Object PSObject -Property @{ Name = 'Mouse Properties'; Command = 'control mouse' }
	$collection += New-Object PSObject -Property @{ Name = 'Mouse Properties'; Command = 'main.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Nero (if installed)'; Command = 'nero' }
	$collection += New-Object PSObject -Property @{ Name = 'Netmeeting'; Command = 'conf' }
	$collection += New-Object PSObject -Property @{ Name = 'Network Connections'; Command = 'control netconnections' }
	$collection += New-Object PSObject -Property @{ Name = 'Network Connections'; Command = 'ncpa.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Network Setup Wizard'; Command = 'netsetup.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Notepad'; Command = 'notepad' }
	$collection += New-Object PSObject -Property @{ Name = 'Nview Desktop Manager (If Installed)'; Command = 'nvtuicpl.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Object Packager'; Command = 'packager' }
	$collection += New-Object PSObject -Property @{ Name = 'ODBC Data Source Administrator'; Command = 'odbccp32.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'On Screen Keyboard'; Command = 'osk' }
	$collection += New-Object PSObject -Property @{ Name = 'Opens AC3 Filter (If Installed)'; Command = 'ac3filter.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Outlook Express'; Command = 'msimn' }
	$collection += New-Object PSObject -Property @{ Name = 'Paint'; Command = 'pbrush' }
	$collection += New-Object PSObject -Property @{ Name = 'Password Properties'; Command = 'password.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Performance Monitor'; Command = 'perfmon' }
	$collection += New-Object PSObject -Property @{ Name = 'Performance Monitor'; Command = 'perfmon.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Phone and Modem Options'; Command = 'telephon.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Phone Dialer'; Command = 'dialer' }
	$collection += New-Object PSObject -Property @{ Name = 'Pinball Game'; Command = 'pinball' }
	$collection += New-Object PSObject -Property @{ Name = 'Power Configuration'; Command = 'powercfg.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Printers and Faxes'; Command = 'control printers' }
	$collection += New-Object PSObject -Property @{ Name = 'Printers Folder'; Command = 'printers' }
	$collection += New-Object PSObject -Property @{ Name = 'Private Character Editor'; Command = 'eudcedit' }
	$collection += New-Object PSObject -Property @{ Name = 'Quicktime (If Installed)'; Command = 'QuickTime.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Quicktime Player (if installed)'; Command = 'quicktimeplayer' }
	$collection += New-Object PSObject -Property @{ Name = 'Real Player (if installed)'; Command = 'realplay' }
	$collection += New-Object PSObject -Property @{ Name = 'Regional Settings'; Command = 'intl.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Registry Editor'; Command = 'regedit' }
	$collection += New-Object PSObject -Property @{ Name = 'Registry Editor'; Command = 'regedit32' }
	$collection += New-Object PSObject -Property @{ Name = 'Remote Access Phonebook'; Command = 'rasphone' }
	$collection += New-Object PSObject -Property @{ Name = 'Remote Desktop'; Command = 'mstsc' }
	$collection += New-Object PSObject -Property @{ Name = 'Removable Storage Operator Requests'; Command = 'ntmsoprq.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Removable Storage'; Command = 'ntmsmgr.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Resultant Set of Policy (XP Prof)'; Command = 'rsop.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Scanners and Cameras'; Command = 'sticpl.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Scheduled Tasks'; Command = 'control schedtasks' }
	$collection += New-Object PSObject -Property @{ Name = 'Security Center'; Command = 'wscui.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Services'; Command = 'services.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Shared Folders'; Command = 'fsmgmt.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Shuts Down Windows'; Command = 'shutdown' }
	$collection += New-Object PSObject -Property @{ Name = 'Sounds and Audio'; Command = 'mmsys.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Spider Solitare Card Game'; Command = 'spider' }
	$collection += New-Object PSObject -Property @{ Name = 'SQL Client Configuration'; Command = 'cliconfg' }
	$collection += New-Object PSObject -Property @{ Name = 'System Configuration Editor'; Command = 'sysedit' }
	$collection += New-Object PSObject -Property @{ Name = 'System Configuration Utility'; Command = 'msconfig' }
	$collection += New-Object PSObject -Property @{ Name = 'System File Checker Utility (Purge File Cache)'; Command = 'sfc /purgecache' }
	$collection += New-Object PSObject -Property @{ Name = 'System File Checker Utility (Return to Default Setting)'; Command = 'sfc /revert' }
	$collection += New-Object PSObject -Property @{ Name = 'System File Checker Utility (Scan Immediately)'; Command = 'sfc /scannow' }
	$collection += New-Object PSObject -Property @{ Name = 'System File Checker Utility (Scan On Every Boot)'; Command = 'sfc /scanboot' }
	$collection += New-Object PSObject -Property @{ Name = 'System File Checker Utility (Scan Once At Next Boot)'; Command = 'sfc /scanonce' }
	$collection += New-Object PSObject -Property @{ Name = 'System File Checker Utility (Set Cache Size to size x)'; Command = 'sfc /cachesize=x' }
	$collection += New-Object PSObject -Property @{ Name = 'System Information'; Command = 'msinfo32' }
	$collection += New-Object PSObject -Property @{ Name = 'System Properties'; Command = 'sysdm.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Task Manager'; Command = 'taskmgr' }
	$collection += New-Object PSObject -Property @{ Name = 'TCP Tester'; Command = 'tcptest' }
	$collection += New-Object PSObject -Property @{ Name = 'Telnet Client'; Command = 'telnet' }
	$collection += New-Object PSObject -Property @{ Name = 'Tweak UI (if installed)'; Command = 'tweakui' }
	$collection += New-Object PSObject -Property @{ Name = 'User Account Management'; Command = 'nusrmgr.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Utility Manager'; Command = 'utilman' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Address Book Import Utility'; Command = 'wabmig' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Address Book'; Command = 'wab' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Backup Utility (if installed)'; Command = 'ntbackup' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Explorer'; Command = 'explorer' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Firewall'; Command = 'firewall.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Firewall (Advanced)'; Command = 'WF.cpl' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Magnifier'; Command = 'magnify' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Management Infrastructure'; Command = 'wmimgmt.msc' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Media Player'; Command = 'wmplayer' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Messenger'; Command = 'msmsgs' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Picture Import Wizard (need camera connected)'; Command = 'wiaacmgr' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows System Security Tool'; Command = 'syskey' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Update Launches'; Command = 'wupdmgr' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows Version (to show which version of windows)'; Command = 'winver' }
	$collection += New-Object PSObject -Property @{ Name = 'Windows XP Tour Wizard'; Command = 'tourstart' }
	$collection += New-Object PSObject -Property @{ Name = 'Wordpad'; Command = 'write' }
	
	return $collection
}