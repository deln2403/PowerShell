# Disable / Enable Symantec Endpoint Protection



Function Disable-Sep() {

  $wd = (pwd).Path;
  $binDir = "C:\Program Files (x86)\Symantec\Symantec Endpoint Protection\12.1.4013.4013.105\Bin"
  $binEnabledName = "ccSvcHst.exe"
  $binDisabledName = "ccSvcHst.exe.disabled"
  $processName = "ccSvcHst";

  $currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
  if ($currentPrincipal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )) {

    cd $binDir;
    if (!(Test-Path -Path $binEnabledName)) {

      Write-Host "Bin can not be found. Is it already disabled?"
    }
    else {

      Move-Item $binEnabledName $binDisabledName
      $processes = Get-Process | ? {$_.ProcessName -like $processName}
      foreach ($process in $processes) {

        Stop-Process $process -Force 
      }
    }	
  }
  else {

    Write-Host "Please execute command as Administrator" -foregroundcolor RED 
  }
  cd $wd;
}


Function Enable-Sep() {

$wd = (pwd).Path;
$binDir = "C:\Program Files (x86)\Symantec\Symantec Endpoint Protection\12.1.4013.4013.105\Bin";
$binEnabledName = "ccSvcHst.exe";
$binDisabledName = "ccSvcHst.exe.disabled";
$serviceName = "SepMasterService";

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
if ($currentPrincipal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )) {

  cd $binDir;
  if (!(Test-Path -Path $binDisabledName)) {

    Write-Host "Bin can not be found. Is it already enabled?";
  }
  else {

    Move-Item $binDisabledName $binEnabledName
    Start-Service $serviceName 
  }
}
else {

  Write-Host "Please execute command as Administrator" -foregroundcolor RED;
}
cd $wd;
}
