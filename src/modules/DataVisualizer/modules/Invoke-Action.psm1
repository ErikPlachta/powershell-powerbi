# modules/DataVisualizer/modules/Invoke-Action.psm1

<#
.SYNOPSIS
    Executes predefined actions using the DataVisualizer module.

.DESCRIPTION
    This module provides functions to execute predefined actions using the DataVisualizer module.

.PARAMETER LogPath
    The path to the log file. Uses default path if not provided.

.PARAMETER OutputPath
    The path where the visualization will be saved. Uses default path if not provided.

.PARAMETER ActionConfig
    The configuration for the action to be executed.

.EXAMPLE
    Invoke-Action -ActionConfig "path/to/config.json"
#>
function Invoke-Action {
    param (
        [Parameter(Mandatory = $true)][string]$ActionConfig,
        [Parameter(Mandatory = $true)][string]$BasePath,
        [Parameter(Mandatory = $true)][string]$OutputPath
    )

    $action = Get-Config -ConfigFilePath $ActionConfig


    # Concats the path to the action file
    $actionFilePath = Join-Path -Path $BasePath -ChildPath $action.Path
    # Concats the output path with the file name and format.
    $actionOutputPath = Join-Path -Path $OutputPath -ChildPath "$($action.OutputName).$($action.OutputFormat.ToLower())"

    write-host $action

    # Example action execution logic
    if ($action.ActionType -eq "VisualizeLogs") {
        Set-VisualLogs -Path $actionFilePath -OutputFormat $action.OutputFormat -OutputPath $actionOutputPath
    } elseif ($action.ActionType -eq "VisualizeData") {
        Set-VisualData -Path $actionFilePath -OutputFormat $action.OutputFormat -OutputPath $actionOutputPath
    } else {
        return @{
            success= $false;
            message= "Unknown action type: $($action.ActionType)"
            }
    }
}

Export-ModuleMember -Function Invoke-Action
