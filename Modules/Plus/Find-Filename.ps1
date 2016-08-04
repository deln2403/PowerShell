function Find-Filename {
  param(
    [parameter(mandatory=$true,position=0)] [string]$Location,
    [parameter(mandatory=$true,position=1)] [string]$Word
  )

  Push-Location
  try { Set-Location $Location }
  catch { throw "Unable to set location to: $Location" }
  Write-Host ('Searching for filname '+$Word+' in location '+(Get-Location).Path+' ...')
  ls -Recurse | ?{$_.Name -match "$Word"}
  Pop-Location
}

Set-Alias find Find-Filename