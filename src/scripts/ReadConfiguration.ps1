# scripts/ReadConfiguration.ps1

<#
.SYNOPSIS
    Reads the configuration file.

.DESCRIPTION
    Reads the configuration settings from a JSON file.

.PARAMETER ConfigFilePath
    The path to the configuration file.

.EXAMPLE
    .\ReadConfiguration.ps1 -ConfigFilePath "config.json"
#>
param (
    [Parameter(Mandatory = $true)]
    [string]$ConfigFilePath
)

# Import the DataVisualizer ConfigReader module
$modulePath = Join-Path -Path $PSScriptRoot -ChildPath "modules"
Import-Module (Join-Path -Path $modulePath -ChildPath "DataVisualizer/ConfigReader.psm1")

$config = Get-Config -ConfigFilePath $ConfigFilePath
Write-Output $config