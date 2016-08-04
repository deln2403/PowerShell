

function New-PortForward() {
  Param(
        [Parameter(Mandatory=$true, Position=0)] $ListenIp,
        [Parameter(Mandatory=$true, Position=1)] $ListenPort,
        [Parameter(Mandatory=$true, Position=2)] $ConnectIp,
        [Parameter(Mandatory=$true, Position=3)] $Connect
        )
  netsh interface portproxy add v4tov4 listenport=$ListenPort listenaddress=$ListenIp connectport=$ConnectPort connectaddress=$ConnectIp
}
