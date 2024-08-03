# scripts/ExecuteActions.ps1

<#
.SYNOPSIS
    Executes Power BI actions based on configurations.

.DESCRIPTION
    Reads the configurations from the specified directory and executes the actions using the PowerBiManager module.

.PARAMETER ConfigDirectory
    The directory containing the configuration files.

.PARAMETER OutputDirectory
    The directory where outputs will be saved.

.EXAMPLE
    .\ExecuteActions.ps1 -ConfigDirectory "actions" -OutputDirectory "output"
#>
param (
    [Parameter(Mandatory = $true)]
    [string]$ConfigDirectory,

    [Parameter(Mandatory = $true)]
    [string]$OutputDirectory
)

# Import the PowerBiManager module
$modulePath = Join-Path -Path $PSScriptRoot -ChildPath "modules"
Import-Module (Join-Path -Path $modulePath -ChildPath "PowerBiManager")

$configs = Get-Configs -ConfigDirectory $ConfigDirectory
$results = Execute-Actions -Configs $configs

# Save results to the output directory
$resultFilePath = Join-Path -Path $OutputDirectory -ChildPath "results.json"
$results | ConvertTo-Json -Depth 3 | Set-Content -Path $resultFilePath

Write-Output $results