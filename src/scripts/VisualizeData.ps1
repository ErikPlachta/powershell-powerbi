# scripts/VisualizeData.ps1

<#
.SYNOPSIS
    Visualizes logs and report data.

.DESCRIPTION
    Creates HTML or Excel visualizations for logs and report data using the DataVisualizer module.

.PARAMETER LogFilePath
    The path to the log file.

.PARAMETER DataFilePath
    The path to the data file.

.PARAMETER VisualizationOutputPath
    The path where the visualization will be saved.

.PARAMETER DataVisualizationOutputPath
    The path where the data visualization will be saved.

.EXAMPLE
    .\VisualizeData.ps1 -LogFilePath "logs/logfile.log" -DataFilePath "data/example-report.csv" -VisualizationOutputPath "visualizations/output/logs.html" -DataVisualizationOutputPath "visualizations/output/report.html"
#>
param (
    [Parameter(Mandatory = $true)]
    [string]$LogFilePath,

    [Parameter(Mandatory = $true)]
    [string]$DataFilePath,

    [Parameter(Mandatory = $true)]
    [string]$VisualizationOutputPath,

    [Parameter(Mandatory = $true)]
    [string]$DataVisualizationOutputPath
)

# Import the DataVisualizer modules
$modulePath = Join-Path -Path $PSScriptRoot -ChildPath "modules"
Import-Module (Join-Path -Path $modulePath -ChildPath "DataVisualizer")

Visualize-Logs -LogFilePath $LogFilePath -OutputFormat "HTML" -OutputPath $VisualizationOutputPath
Visualize-Data -DataFilePath $DataFilePath -OutputFormat "HTML" -OutputPath $DataVisualizationOutputPath