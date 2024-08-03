# scripts/LogResults.ps1

<#
.SYNOPSIS
    Logs the results of Power BI actions.

.DESCRIPTION
    Logs the results to a specified log file using the DataVisualizer Logger module.

.PARAMETER Results
    The results to log.

.PARAMETER LogFilePath
    The path to the log file.

.EXAMPLE
    .\LogResults.ps1 -Results $results -LogFilePath "logs/logfile.log"
#>
param (
    [Parameter(Mandatory = $true)]
    [array]$Results,

    [Parameter(Mandatory = $true)]
    [string]$LogFilePath
)

# Import the DataVisualizer Logger module
$modulePath = Join-Path -Path $PSScriptRoot -ChildPath "modules"
Import-Module (Join-Path -Path $modulePath -ChildPath "DataVisualizer/Logger.psm1")

foreach ($result in $Results) {
    $logMessage = "Action: $($result.Action), ReportId: $($result.ReportId), Result: $($result.Result | ConvertTo-Json -Depth 2)"
    Write-Log -LogFilePath $LogFilePath -Message $logMessage
}