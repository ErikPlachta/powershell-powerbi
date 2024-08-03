# modules/PowerBiManager/modules/ExecuteActions.psm1

<#
.SYNOPSIS
    Executes predefined actions using the PowerBiManager module.

.DESCRIPTION
    This module provides functions to execute predefined actions using the PowerBiManager module.

.PARAMETER ActionConfig
    The configuration for the action to be executed.

.EXAMPLE
    Execute-Actions -ActionConfig "path/to/config.json"
#>
function Execute-Actions {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ActionConfig
    )

    $config = Get-Config -ConfigFilePath $ActionConfig

    # Example action execution logic
    if ($config.ActionType -eq "ExecuteReport") {
        Execute-Report -WorkspaceId $config.WorkspaceId -ReportId $config.ReportId -QueryParameters $config.QueryParameters
    } elseif ($config.ActionType -eq "ExecuteDax") {
        Execute-DaxQuery -WorkspaceId $config.WorkspaceId -DatasetId $config.DatasetId -DaxQuery $config.DaxQuery
    } else {
        Write-Log -LogFilePath $config.logFilePath -Message "Unknown action type: $($config.ActionType)"
    }
}

Export-ModuleMember -Function Execute-Actions
