Write-Host "Connecting to Azure Purview..."
try{
    Install-Module -Name ExchangeOnlineManagement -Force -AllowClobber -ErrorAction Stop
    Import-Module ExchangeOnlineManagement -ErrorAction Stop
    Connect-IPPSSession 
}
catch {
    Write-Host "Failed to connect to Azure Purview. Error: $_"
    throw $_
}
Write-Host "Connected to Azure Purview successfully." 