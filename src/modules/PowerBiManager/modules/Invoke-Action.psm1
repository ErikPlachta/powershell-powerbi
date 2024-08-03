# modules/PowerBiManager/modules/Invoke-Action.psm1

<#
.SYNOPSIS
    Executes predefined actions using the PowerBiManager module.

.DESCRIPTION
    This module provides functions to execute predefined actions using the PowerBiManager module.

.PARAMETER ActionConfig
    The configuration for the action to be executed.

.PARAMETER BasePath
    The base path for the action files.

.PARAMETER OutputPath
    The path where the results will be saved.

.EXAMPLE
    Invoke-Action -ActionConfig "path/to/config.json" -BasePath "path/to/base" -OutputPath "path/to/output"
#>
function Invoke-Action {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ActionConfig,
        [Parameter(Mandatory = $true)]
        [string]$BasePath,
        [Parameter(Mandatory = $true)]
        [string]$OutputPath
    )

    $action = Get-Config -Path $ActionConfig

    # Concatenate the path to the action file
    $actionFilePath = Join-Path -Path $BasePath -ChildPath $action.Path
    
    # Concatenate the output path with the file name and format
    $actionOutputPath = Join-Path -Path $OutputPath -ChildPath "$($action.OutputName).$($action.OutputFormat.ToLower())"

    # Example action execution logic
    switch ($action.ActionType) {
        "InvokeDaxQuery" {
            Invoke-DaxQuery -WorkspaceId $action.WorkspaceId -DatasetId $action.DatasetId -DaxQuery $action.DaxQuery
        }
        "InvokeReportQuery" {
            Invoke-ReportQuery -WorkspaceId $action.WorkspaceId -ReportId $action.ReportId -QueryParameters $action.QueryParameters
        }
        "InvokeReportsQuery" {
            foreach ($report in $action.Reports) {
                Invoke-ReportQuery -WorkspaceId $action.WorkspaceId -ReportId $report.ReportId -QueryParameters $report.QueryParameters
            }
        }
        default {
            return @{
                success = $false
                message = "Unknown action type: $($action.ActionType)"
            }
        }
    }
}

Export-ModuleMember -Function Invoke-Action
