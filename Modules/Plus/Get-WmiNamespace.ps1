
Function Get-WmiNamespace {
  gwmi -namespace "root" -class "__Namespace" | Select Name
}
