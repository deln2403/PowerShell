<#
.Synopsis
   Generates one or more complex passwords designed to fulfill the requirements for Active Directory
.DESCRIPTION
   Generates one or more complex passwords designed to fulfill the requirements for Active Directory
.EXAMPLE
   New-SWRandomPassword

   Will generate one password with a length of 8 chars.
.EXAMPLE
   New-SWRandomPassword -MinPasswordLength 8 -MaxPasswordLength 12 -Count 4

   Will generate four passwords with a length of between 8 and 12 chars.
.OUTPUTS
   [String]
.NOTES
   Written by Simon Wåhlin, blog.simonw.se
   I take no responsibility for any issues caused by this script.
.FUNCTIONALITY
   Generates random passwords
.LINK
   http://blog.simonw.se/powershell-generating-random-password-for-active-directory/
   
#>
function New-PasswordCustom {
    [CmdletBinding(ConfirmImpact='Low')]
    [OutputType([String])]
    Param
    (
        # Specifies minimum password length
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$false,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0)]
        [ValidateScript({$_ -gt 0})]
        [Alias("Min")] 
        [int]$MinPasswordLength = 8,
        
        # Specifies maximum password length
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$false,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=1)]
        [ValidateScript({$_ -ge $MinPasswordLength})]
        [Alias("Max")]
        [int]$MaxPasswordLength = 12,
        
        # Specifies an array of strings containing charactergroups from which the password will be generated.
        # At least one char from each group (string) will be used.
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$false,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=2)]
        [String[]]$InputStrings = @('abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', '0123456789', '!"#%&'),
        
        # Specifies number of passwords to generate.
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$false,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=3)]
        [ValidateScript({$_ -gt 0})]
        [int]$Count = 1
    )
    Begin {
        Function Get-Seed{
            # Generate a seed for future randomization
            $RandomBytes = New-Object -TypeName 'System.Byte[]' 4
            $Random = New-Object -TypeName 'System.Security.Cryptography.RNGCryptoServiceProvider'
            $Random.GetBytes($RandomBytes)
            [BitConverter]::ToInt32($RandomBytes, 0)
        }
    }
    Process {
        For($iteration = 1;$iteration -le $Count; $iteration++){
            # Create char arrays containing possible chars
            [char[][]]$CharGroups = $InputStrings

            # Set counter of used groups
            [int[]]$UsedGroups = for($i=0;$i -lt $CharGroups.Count;$i++){0}



            # Create new char-array to hold generated password
            if($MinPasswordLength -eq $MaxPasswordLength) {
                # If password length is set, use set length
                $password = New-Object -TypeName 'System.Char[]' $MinPasswordLength
            }
            else {
                # Otherwise randomize password length
                $password = New-Object -TypeName 'System.Char[]' (Get-Random -SetSeed $(Get-Seed) -Minimum $MinPasswordLength -Maximum $($MaxPasswordLength+1))
            }

            for($i=0;$i -lt $password.Length;$i++){
                if($i -ge ($password.Length - ($UsedGroups | Where-Object {$_ -eq 0}).Count)) {
                    # Check if number of unused groups are equal of less than remaining chars
                    # Select first unused CharGroup
                    $CharGroupIndex = 0
                    while(($UsedGroups[$CharGroupIndex] -ne 0) -and ($CharGroupIndex -lt $CharGroups.Length)) {
                        $CharGroupIndex++
                    }
                }
                else {
                    #Select Random Group
                    $CharGroupIndex = Get-Random -SetSeed $(Get-Seed) -Minimum 0 -Maximum $CharGroups.Length
                }

                # Set current position in password to random char from selected group using a random seed
                $password[$i] = Get-Random -SetSeed $(Get-Seed) -InputObject $CharGroups[$CharGroupIndex]
                # Update count of used groups.
                $UsedGroups[$CharGroupIndex] = $UsedGroups[$CharGroupIndex] + 1
            }
            Write-Output -InputObject $($password -join '')
        }
    }
}