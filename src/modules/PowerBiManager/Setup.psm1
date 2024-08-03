# modules/PowerBiManager/Setup.psm1

<#
.SYNOPSIS
    Provides setup functionality for PowerBiManager.

.DESCRIPTION
    This module provides functions to create necessary folder structures and handle other setup requirements.

.PARAMETER BasePath
    The base path where the setup will be performed.

.EXAMPLE
    Initialize-PowerBiManager -BasePath $PSScriptRoot
#>
function Initialize-PowerBiManager {
    param (
        [Parameter(Mandatory = $true)]
        [string]$BasePath
    )

    # Define required directories
    $requiredDirectories = @(
        "actions",
        "output"
    )

    # Create directories
    foreach ($dir in $requiredDirectories) {
        $fullPath = Join-Path -Path $BasePath -ChildPath $dir
        if (-not (Test-Path -Path $fullPath)) {
            New-Item -Path $fullPath -ItemType Directory -Force
        }
    }

    # Create default config files if necessary
    $configPath = Join-Path -Path $BasePath -ChildPath "config.json"
    if (-not (Test-Path -Path $configPath)) {
        $defaultConfig = @{
            logFilePath = "logs/logfile.log"
            configDirectory = "actions"
            outputDirectory = "output"
        } | ConvertTo-Json -Depth 3
        Set-Content -Path $configPath -Value $defaultConfig
    }
}

Export-ModuleMember -Function Initialize-PowerBiManager