function Get-IPDetails() {
  Get-WmiObject -Class Win32_NetworkAdapterConfiguration `
    -Filter IPEnabled=TRUE -ComputerName .  | `
    Select-Object -Property [a-z]* -ExcludeProperty IPX*,WINS*
}
