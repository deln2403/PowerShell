Configuration PullClientDsc  {
	Param ()
	
	Node $AllNodes.NodeName 	{
		LocalConfigurationManager {
			ConfigurationID = $Node.Guid
			ConfigurationModeFrequencyMins = $Node.ConfigurationFrequencyMins
			ConfigurationMode = 'ApplyAndAutocorrect'
			RefreshMode = 'Pull'
			DownloadManagerName = 'WebDownloadManager'
			DownloadManagerCustomData = (@{ServerUrl=$Node.PullServerUrl ;AllowUnsecureConnection = 'true'})
			RebootNodeIfNeeded = $Node.RebootNodeIfNeeded
			AllowModuleOverwrite = $true
		}
	}
}

