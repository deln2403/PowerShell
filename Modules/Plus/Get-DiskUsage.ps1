function Get-DiskUsage {
  param(
      [Parameter(
        ParameterSetName='Default', 
        Mandatory=$false, 
        Position=0, 
        ValueFromPipeline=$true, 
        ValueFromPipelineByPropertyName=$true)]
      [Alias('p')]
      [string[]]
      $Path = $(Get-Location)
  )
  # Get the full canonical FileSystem path:
  $root = Convert-Path $Path

  $size = 0
  $files = 0
  $folders = 0

  $items = Get-ChildItem $root
  foreach($item in $items) {
    if($item.PSIsContainer) {
      # Call myself recursively to calculate subfolder size
      # Since we're streaming output as we go, 
      #   we only use the last output of a recursive call
      #   because that's the summary object
      if ($recurse) {
        Get-Size $item.FullName | Tee-Object -Variable subItems
        $subItem = $subItems[-1]
      } else {
        $subItem = Get-Size $item.FullName | Select -Last 1
				Write-Output "[$subItem] $($item.FullName)"
      }

      # The (recursive) size of all subfolders gets added
      $size += $subItem.Size
      $folders += $subItem.Folders + 1
      $files += $subItem.Files
    } else {
      $files += 1
      $size += $item.Length
    }
  }

  # in PS3, use the CustomObject trick to control the output order
    $out = New-Object PSObject -Property @{ 
      Name = $root
			Size = $size
      Folders = $folders
      Files = $Files
    }
		
		$out | select Name, Size, Folders, Files
}
