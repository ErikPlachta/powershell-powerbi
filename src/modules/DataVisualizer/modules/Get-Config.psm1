# modules/DataVisualizer/ConfigReader.psm1

<#
.SYNOPSIS
    Reads configuration files for visualization settings.

.DESCRIPTION
    This module provides functions to read configuration files specifying default settings for visualizations.

.PARAMETER Path
    The path to the configuration file.

.EXAMPLE
    $config = Get-Config -Path "config.json"

.OUTPUTS
    PSCustomObject representing the configuration settings.
#>
function Get-Config {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $configContent = Get-Content -Path $Path -Raw | ConvertFrom-Json
    return $configContent
}

Export-ModuleMember -Function Get-Config
