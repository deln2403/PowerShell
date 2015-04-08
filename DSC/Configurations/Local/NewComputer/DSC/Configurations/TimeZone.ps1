Configuration TimeZone {
	Param (
		[String[]]$NodeName = $env:COMPUTERNAME,

		[Parameter(Mandatory = $true)]
		[ValidateNotNullorEmpty()]
		[String] $SystemTimeZone
	)

	Import-DSCResource -ModuleName xTimeZone

	Node $NodeName {
		xTimeZone TimeZone {
			TimeZone = $SystemTimeZone
		}
	}
}
