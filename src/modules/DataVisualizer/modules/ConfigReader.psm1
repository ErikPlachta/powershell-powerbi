# modules/DataVisualizer/ConfigReader.psm1

<#
.SYNOPSIS
    Reads configuration files for visualization settings.

.DESCRIPTION
    This module provides functions to read configuration files specifying default settings for visualizations.

.PARAMETER ConfigFilePath
    The path to the configuration file.

.EXAMPLE
    $config = Get-Config -ConfigFilePath "config.json"

.OUTPUTS
    PSCustomObject representing the configuration settings.
#>
function Get-Config {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ConfigFilePath
    )

    $configContent = Get-Content -Path $ConfigFilePath -Raw | ConvertFrom-Json
    return $configContent
}

Export-ModuleMember -Function Get-Config
