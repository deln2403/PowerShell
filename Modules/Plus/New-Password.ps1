<#



#>

Function New-Password() {
  Param(
  [int]$length=10
  )
  $alphabet=$NULL;For ($a=65;$a -le 90;$a++) {$alphabet+=,[char][byte]$a }

  For ($loop=1; $loop -le $length; $loop++) {
    $TempPassword+=($alphabet | GET-RANDOM)
  }

  return $TempPassword
}
