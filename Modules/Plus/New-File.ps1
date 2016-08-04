function New-File {
  param(
    [parameter(mandatory=$false,position=0)]
    [string]$Filename = 'New File.txt',
    [parameter(mandatory=$false,position=1)]
    [string]$Location =  '.'
  )
  
  BEGIN {
    Push-Location
  }
  
  PROCESS {
    Set-Location (Convert-Path (Get-Location))
    New-Item -Type file -Path $Filename;
  }
  
  END {
    Pop-Location
  }
}


