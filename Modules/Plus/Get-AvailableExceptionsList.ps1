function Get-AvailableExceptionsList {
    [CmdletBinding()]
    param()
    end {
        $irregulars = 'Dispose|OperationAborted|Unhandled|ThreadAbort|ThreadStart|TypeInitialization'
        [AppDomain]::CurrentDomain.GetAssemblies() | ForEach-Object {
            $_.GetExportedTypes() -match 'Exception' -notmatch $irregulars |
            Where-Object {
                $_.GetConstructors() -and $(
                $_exception = New-Object $_.FullName
                New-Object Management.Automation.ErrorRecord $_exception, ErrorID, OpenError, Target
                )
            } | Select-Object -ExpandProperty FullName
        } 2> $null
    }

 <#  .Synopsis      Retrieves all available Exceptions to construct ErrorRecord objects.  .Description      Retrieves all available Exceptions in the current session to construct ErrorRecord objects.  .Example      $availableExceptions = Get-AvailableExceptionsList      Description      ===========      Stores all available Exception objects in the variable 'availableExceptions'.  .Example      Get-AvailableExceptionsList | Set-Content $env:TEMP\AvailableExceptionsList.txt      Description      ===========      Writes all available Exception objects to the 'AvailableExceptionsList.txt' file in the user's Temp directory.  .Inputs     None  .Outputs     System.String  .Link      New-ErrorRecord  .Notes      Name:      Get-AvailableExceptionsList      Author:    Robert Robelo      LastEdit:  08/24/2011 12:35  #>
}

#http://www.powershellmagazine.com/2011/09/14/custom-errors/
