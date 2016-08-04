function Set-ConsentPromptBehaviorAdmin {
  [CmdletBinding()]
  param(
    [Parameter( 
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true, 
        ValueFromRemainingArguments=$false, 
        Position=0
    )][string]$ComputerName = $env:COMPUTERNAME,
    [validaterange(0,5)][int]$ConsentPromptBehaviorAdmin = 5,
    [validaterange(0,1)][int]$PromptOnSecureDesktop = 0
    <#
    [switch]$RevertToDefault,
    [validaterange(0,1)][int]$FilterAdministratorTokenD = 1,
    [validaterange(0,1)][int]$EnableUIADesktopToggleD = 0,
    [validaterange(0,3)][int]$ConsentPromptBehaviorUserD = 0,
    [validaterange(0,1)][int]$EnableInstallerDetectionD = 1,
    [validaterange(0,1)][int]$ValidateAdminCodeSignaturesD = 0,
    [validaterange(0,1)][int]$EnableSecureUIAPathsD = 1,
    [validaterange(0,1)][int]$EnableLUAD = 1,
    [validaterange(0,1)][int]$EnableVirtualizationD = 1
    #>
    )
    Begin {
      function quote-list {$args}
      
      #Define key for UAC values
      $key = "Software\Microsoft\Windows\CurrentVersion\Policies\System"
  
      #Define UAC Values
      $values = quote-list ConsentPromptBehaviorAdmin PromptOnSecureDesktop
    }
    Process{
        #test the connection
        if(Test-connection $ComputerName -quiet -count 2 -buffersize 16){

            #init results array
            $results = @()

            try{
                #open the registry key on remote ComputerName
                $OpenRegistry = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine,$ComputerName)
    
   
                #for each value, add value and data pair to a custom object
                foreach($value in $values) {
        
                    #set the value
                    $subkey = $OpenRegistry.OpenSubKey($key,$true)
                    $subkey.SetValue($value, (Get-Variable -Name "$value").value)
                }
            }
            Catch{
                Write-Error "Error no admin prompt UAC settings from $computer"
            }
        }
    }
}