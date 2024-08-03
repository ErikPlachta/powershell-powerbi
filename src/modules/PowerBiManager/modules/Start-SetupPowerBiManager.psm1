# modules/PowerBiManager/Start-PowerBiManager.psm1

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
function Start-SetupPowerBiManager {
    param (
        [Parameter(Mandatory = $true)]
        [string]$BasePath
    )

    # Check dependencies
    $dependencies = @('MicrosoftPowerBIMgmt')
    if (-not (Get-Dependencies -Dependencies $dependencies)) {
        throw "Required dependencies are not installed."
    }


    # Define required directories
    $requiredDirectories = @(
        ".actions",
        ".output",
        ".logs"
        
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
            LogPath = ".logs"
            actionPath = ".actions"
            OutputPath = ".output"
        } | ConvertTo-Json -Depth 3
        Set-Content -Path $configPath -Value $defaultConfig
    }
}

Export-ModuleMember -Function Start-SetupPowerBiManager
