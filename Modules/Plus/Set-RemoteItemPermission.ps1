###############################################################################
##  $FileName: Set-RemoteItemPermission.ps1
##  $Version: 0.1
##  $Description: 
##
##  $Author: Nicolas Delorme
##  $CreationDate: 2014-06-12
##  $LastModifiedDate: 
###############################################################################


<#
http://gallery.technet.microsoft.com/scriptcenter/Change-folder-or-file-756a30a2
#>
function Set-RemoteItemPermission() {
    Param(
        [Parameter(Mandatory=$false, Position=0)] $LogFile,
        [Parameter(Mandatory=$true, Position=1)] $Path
        )
        
        $colRights = [System.Security.AccessControl.FileSystemRights]"Read, Write"    
        $InheritanceFlag = [System.Security.AccessControl.InheritanceFlags]::None  
        $PropagationFlag = [System.Security.AccessControl.PropagationFlags]::None 
        $objType =[System.Security.AccessControl.AccessControlType]::Allow 
         
        $objUser = New-Object System.Security.Principal.NTAccount(Get-CurrentUser) 
        $objACE = New-Object System.Security.AccessControl.FileSystemAccessRule ($objUser, $colRights, $InheritanceFlag, $PropagationFlag, $objType) 
         
        $objACL = Get-ACL $Path 
        $objACL.AddAccessRule($objACE) 
         
        Set-ACL $Path $objACL
}