
<#
.SYNOPSIS
	Returns a path from actual disk root. Alternatively returns
	URI style network path

.DESCRIPTION
  Returns the FmsConfig file in XML format 
    if successful, else returns 1.

.PARAMETER Path
 Path to FmsConfig file. If null, ConfigPath from latest registered 
  PSM Module is used

.EXAMPLE
 New-FmsConfig -Path .\FmsConfig\FmsConfig.xml
#>
function Get-UnifiedPath {
    Param(
        [Parameter(
            Mandatory=$false,
            ValueFromPipeline=$true,
            ValueFromPipelinebyPropertyName=$true,
            Position=0 
        )]$Path,
	
	 [switch]$Net
    )
    
    begin {
        Push-Location
        
        # if no path is provided use current location     
        if (!$Path) { $Path = (Get-Location) }
        
        # result is function of input type 
        $type = $Path.gettype().name
        switch ($type) {
            "PathInfo"            { $Path = $Path.Path }
            "DirectoryInfo" { $Path = $Path.fullname }
            "FileInfo"            { $Path = $Path.fullname }
            "String"                {}
            default                 { throw "Invalid path format." }
        }
        
        # validate input is a valid uri format
        if (!$Path) { throw "Invalid path. Please specify an absolute path." } 
        try    { $uri = new-object System.Uri($Path) }
        catch { throw "Invalid path. Please specify an absolute path." }

        if ( (!$uri.OriginalString) -or ($uri.OriginalString -eq "") ) { 
            throw "Invalid path. Please specify an absolute path." } 
    }

    process {		
        switch ( [bool]($uri).IsUnc ) {
            $true { return $uri.OriginalString }
            $false {
			
				Push-Location
				Set-Location $Path
				$Path = "$((Get-Location).Drive.Root)\$((Get-Location).Drive.CurrentLocation)"
				Pop-Location
			
				$root = [System.IO.Path]::GetPathRoot($Path)
				$letter = (Split-Path ($root) -qualifier).Replace(":", "")
				$content = ($Path).Replace($root, "")
			
				if ($Net) {
					$hostname = hostname
					return "\\$hostname\$letter$\$content"
				}
				
				return "$($letter):\$($content)"
            }
            default { throw "An unknown error occurred." }
        }
    }

    end {
        Pop-Location
    }                
}	

Set-Alias -Name Get-UP -Value Get-UnifiedPath

