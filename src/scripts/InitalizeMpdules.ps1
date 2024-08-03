# scripts/InitializeModules.ps1

<#
.SYNOPSIS
    Initializes both PowerBiManager and DataVisualizer modules.

.DESCRIPTION
    Creates necessary folder structures, imports templates, and handles other setup requirements for both modules.

.PARAMETER BasePath
    The base path where the setup will be performed.

.EXAMPLE
    .\InitializeModules.ps1 -BasePath $PSScriptRoot
#>
param (
    [Parameter(Mandatory = $true)]
    [string]$BasePath
)

# Import the PowerBiManager and DataVisualizer modules
$modulePath = Join-Path -Path $BasePath -ChildPath "modules"
Import-Module (Join-Path -Path $modulePath -ChildPath "PowerBiManager")
Import-Module (Join-Path -Path $modulePath -ChildPath "DataVisualizer")

Initialize-PowerBiManager -BasePath $BasePath
Initialize-DataVisualizer -BasePath $BasePath