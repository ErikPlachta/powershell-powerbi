# modules/PowerBiManager/modules/Get-Config.psm1

<#
.SYNOPSIS
    Gets the configuration from a JSON file.

.DESCRIPTION
    This module provides functions to read configuration data from a JSON file.

.PARAMETER Path
    The path to the JSON configuration file.

.EXAMPLE
    Get-Config -Path "path/to/config.json"

.OUTPUTS
    PSObject representing the configuration.
#>
function Get-Config {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    if (-not (Test-Path $Path)) {
        throw "Configuration file not found: $Path"
    }

    $configContent = Get-Content -Path $Path -Raw
    $config = $configContent | ConvertFrom-Json
    return $config
}

Export-ModuleMember -Function Get-Config
