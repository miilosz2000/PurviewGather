Write-Host "Connecting to Azure Purview..."

try{
    ##Import-Module ExchangeOnlineManagement -ErrorAction Stop
    ##Connect-IPPSSession 
}
catch {
    Write-Host "Failed to connect to Azure Purview. Error: $_"
    throw $_
}
Write-Host "Connected to Azure Purview successfully." 



## GatherSensitiveInfoTypes
try{
    $SIT = Get-DlpSensitiveInformationType -ErrorAction Stop
}
catch {
    Write-Host "Failed to gather Sensitive Information Types. Error: $_"
    $SIT = @{"No results found"}
}

## GatherSensitivityLabels
$SL = @{}

## GatherSensitivityAutoLabelPolicies
$AutoLabelPolicies = @{}

## Gather SensitivityLabelsPublishingPolicies
$SLLabelPublishingPolicies = @{}

## GatherDLPPolicyRules
$DLPPolicyRules = @{}

## GatherDLPPolicies
$DLPPolicies = @{}

Disconnect-ExchangeOnline -Confirm:$false

$GatheredData = @{
    BackUpDate                      = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    DLPPolicies                     = $dlpPolicies
    SensitiveInfoTypes              = $SIT
    SensitivityLabels               = $SL
    SensitivityAutoLabelPolicies    = $AutoLabelPolicies
    SensitivityLabelPublishingPolicies = $SLLabelPublishingPolicies
    DLPPolicyRules                  = $DLPPolicyRules
    DLPPoliciesDetails              = $DLPPolicies
}
try{
    if (!(Test-Path -Path "Backups")) {
        New-Item -ItemType Directory -Path "Backups" | Out-Null
    }
}
catch {
    Write-Host "Failed to create Backups directory. Error: $_"
    throw $_
}

$GatheredData |
    ConvertTo-Json -Depth 5 |
    Out-File -FilePath ".\Backups\GatheredData_AzurePurview_$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').json"

