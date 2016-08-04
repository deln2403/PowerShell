
function Get-DismFeature {
    $dism = dism /online /get-features
    $featureCollection = @()

    $featureName = ''
    $featureState = ''
    
    foreach ($line in $dism) { 
        Write-Verbose "Processing line : $line"
        if ( $line | Select-String 'Feature Name : ') {
            if (!($featureName)) { 
                $featureName = $line -replace 'Feature Name :', '' 
            } 
        }
        elseif (($line | Select-String 'State :') -and ($featureName) ) {
            $featureState = $line -replace 'State : ', ''
        }

        if ($featureName -and $featureState) {
            $object = New-Object PSObject -Property @{            
                Name = $featureName                 
                State = $featureState
            }
            
            $featureCollection += $object
            $featureName = ''
            $featureState = ''
        }
    }

    return $featureCollection
}

