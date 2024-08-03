# modules/PowerBiManager/modules/Start-SetupPowerBiManager.psm1

<#
.SYNOPSIS
    Sets up the necessary directory structure for the PowerBiManager module.

.DESCRIPTION
    This function creates the necessary directories for the PowerBiManager module to operate correctly.

.PARAMETER BasePath
    The base path where the directories should be created.

.EXAMPLE
    Start-Setup -BasePath "path/to/base"
#>
function Start-SetupPowerBiManager {
    param (
        [Parameter(Mandatory = $true)]
        [string]$BasePath
    )

    $directories = @(
        "$BasePath/.bin",
        "$BasePath/.actions",
        "$BasePath/.output"
        #"$BasePath/.bin/templates",
        #"$BasePath/.bin/tests",
        #"$BasePath/.bin/tests/actions",
        #"$BasePath/.bin/tests/data",
        #"$BasePath/.bin/tests/logs"
    )

    foreach ($dir in $directories) {
        if (-not (Test-Path $dir)) {
            New-Item -ItemType Directory -Path $dir -Force
        }
    }

    Write-Host "Setup completed. All necessary directories have been created."
}

Export-ModuleMember -Function Start-SetupPowerBiManager
