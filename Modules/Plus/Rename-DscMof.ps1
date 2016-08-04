function  Rename-DscMof {
	[Cmdletbinding()]
	param (
		[parameter(
			Mandatory=$true,
			ValueFromPipeline=$false,
			Position=0)]
		[ValidateScript({Test-Path $_ -Include '*.mof'})]
		[Alias('Mof')]
		[String]$Configuration,
		
		[parameter(
			Mandatory=$true,
			ValueFromPipeline=$false,
			Position=1)]
		[ValidateNotNullOrEmpty()]
		[String] $Guid
	)
	
	$newName = "$($Guid).mof"
	
	$WorkingDirectory = (Get-Location).Path
	Set-Location (Split-Path $Configuration)
	
	Move-Item -Path $Configuration -Destination $newName -Force
	New-DscChecksum $newName -Force
	
	Set-Location $WorkingDirectory
}
