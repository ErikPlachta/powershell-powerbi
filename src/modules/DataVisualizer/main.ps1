# modules/DataVisualizer/main.ps1

<#
.SYNOPSIS
    Initializes the DataVisualizer module.

.DESCRIPTION
    This script imports all submodules and exports their functions to initialize the DataVisualizer module.
#>

# Import all submodules
$submodulesPath = Join-Path -Path $PSScriptRoot -ChildPath "modules"
Import-Module (Join-Path -Path $submodulesPath -ChildPath "VisualizeLogs.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "VisualizeData.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "ConfigReader.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Logger.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Setup.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "ExecuteActions.psm1")

# Define the exported functions
Export-ModuleMember -Function Visualize-Logs
Export-ModuleMember -Function Visualize-Data
Export-ModuleMember -Function Get-Config
Export-ModuleMember -Function Write-Log
Export-ModuleMember -Function Initialize-DataVisualizer
Export-ModuleMember -Function Execute-Actions
