# Prompt function
function Request-Confirmation { if ((Read-Host 'To continue type Y') -ne 'Y') { exit } }