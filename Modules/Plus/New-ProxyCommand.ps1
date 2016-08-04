


<#


#>
function New-ProxyCommand {
  param(
    [Parameter(
      Mandatory=$true,
      Position=0,
      ValueFromPipeline=$true,
      ValueFromPipelineByPropertyName=$true)]
    [string]
    ${Command}
  )

  try { $commandDefinition = Get-Command $Command  }
  catch { throw "Unable to location Command: $Command" }

  $MetaData = New-Object System.Management.Automation.CommandMetaData ($commandDefinition ) 
  
  return ( [System.Management.Automation.ProxyCommand]::Create($MetaData) )

}
