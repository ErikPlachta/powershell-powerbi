# scripts/TestDataVisualizer.ps1

<#
.SYNOPSIS
    Tests the DataVisualizer module by executing predefined actions.

.DESCRIPTION
    This script tests the DataVisualizer module by executing actions defined in configuration files.

.EXAMPLE
    .\TestDataVisualizer.ps1
#>

# Define the paths
$basePath = $PSScriptRoot
$modulePath = Join-Path -Path $basePath -ChildPath "../DataVisualizer"
$actionConfigsPath = Join-Path -Path $modulePath -ChildPath ".bin/tests/actions"



# Import the DataVisualizer module
Import-Module $modulePath

# Execute visualize logs action
$visualizeLogsConfig = Join-Path -Path $actionConfigsPath -ChildPath "logsToHtml.json"
Execute-Actions -ActionConfig $visualizeLogsConfig

# Execute visualize data action
$visualizeDataConfig = Join-Path -Path $actionConfigsPath -ChildPath "dataTohtml.json"
Execute-Actions -ActionConfig $visualizeDataConfig

Write-Host "DataVisualizer module tests completed."
