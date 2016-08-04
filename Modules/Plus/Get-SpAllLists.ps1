FUNCTION Get-SpAllLists() {

  param  (
    [string] $URL, 
    [boolean] $WriteToFile = $true 
  )

  #Get all lists in farm 
  Add-PSSnapin Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue

  #Counter variables 
  $webcount = 0 
  $listcount = 0

  if($WriteToFile -eq $true) {
    $outputPath = Read-Host "Outputpath (e.g. C:\directory\filename.txt)" 
  } 
  if(!$URL) {
    #Grab all webs 
    $webs = (Get-SPSite -limit all | Get-SPWeb -Limit all -ErrorAction SilentlyContinue) 
  } 
  else {
  $webs = Get-SPWeb $URL 
  } 
  if($webs.count -ge 1 -OR $webs.count -eq $null) {
    foreach($web in $webs) {
      #Grab all lists in the current web 
      $lists = $web.Lists    
      Write-Host "Website"$web.url -ForegroundColor Green  
      if($WriteToFile -eq $true){Add-Content -Path $outputPath -Value "Website $($web.url)"} 
      foreach($list in $lists) {
        $listcount +=1   
        Write-Host " ÎíÎñ "$list.Title           
        if($WriteToFile -eq $true){Add-Content -Path $outputPath -Value " ÎíÎñ $($list.Title)"} 
      } 
      $webcount +=1 
      $web.Dispose() 
    } 
    #Show total counter for checked webs & lists 
    Write-Host "Amount of webs checked:"$webcount 
    Write-Host "Amount of lists:"$listcount 
  } 
  else {
    Write-Host "No webs retrieved, please check your permissions" -ForegroundColor Red -BackgroundColor Black 
  }
}
