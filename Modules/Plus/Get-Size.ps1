function Get-Size {
  #.Synopsis
  #  Calculate the size of a folder on disk
  #.Description
  #  Recursively calculate the size of a folder on disk,
  #  outputting it's size, and that of all it's children,
  #  and optionally, all of their children
  param(
    [Parameter(
        Mandatory=$true, 
        Position=0, 
        ValueFromPipeline=$true, 
        ValueFromPipelineByPropertyName=$true)]
      [Alias('p')]
      [string]$path
  )  
  
  BEGIN {
    Push-Location
  }
  
  PROCESS {
    try {     
      $colItems = (Get-ChildItem $path -recurse | Measure-Object -property length -sum)
      return ("{0:N2}" -f ($colItems.sum / 1MB) + " MB")
    }
    catch { throw }
  }
  
  END {
    Pop-Location
  }
    
}


