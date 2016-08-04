function New-Zip {
	param(
		[Parameter(Mandatory)]
		[ValidateScript({Test-Path $_})]
		[string] $Item
	)
  
	Get-ChildItem $module -Recurse | Write-Zip -IncludeEmptyDirectories -OutputPath "./$($module.Name).zip"
  
	Set-Location (Convert-Path (Get-Location))
	New-Item -Type file -Path $Filename;
}


# foreach ($module in (ls | ? PSIsContainer)) { Get-ChildItem $module -Recurse | Write-Zip -IncludeEmptyDirectories -OutputPath "./$($module.Name).zip" }

