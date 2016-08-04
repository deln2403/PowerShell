###############################################################################
##  $FileName: Test-EmailString.ps1
##  $Version: 0.1
##  $Description: 
##
##  $Author: Nicolas Delorme
##  $CreationDate: 2015-03-02
##  $LastModifiedDate: 
###############################################################################

$EmailRegex = '^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$';

<#
.SYNOPSIS
    Test-Email returns true if the email format is correct

.DESCRIPTION
    The email is compared against the following RegEx and returns true if it matches.
		It returns false if it does not.
		
		Email RegEx '^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$'
    
.PARAMETER Email
    Email string to be validated
    
.EXAMPLE
    Test-Email -Email 'nicolas.a.delorme@accenture.com'

#>

function Test-EmailString {
	Param([Parameter(Mandatory=$true, valuefrompipeline=$true)][String] $Email)

	if ($Email -match $EmailRegex) {
			return $true }
	else {
			return $false }
}