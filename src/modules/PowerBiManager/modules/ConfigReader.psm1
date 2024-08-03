# modules/PowerBiManager/ConfigReader.psm1

<#
.SYNOPSIS
    Reads configuration files for each report/query to be performed.

.DESCRIPTION
    This module provides a function to read multiple configuration files for each report/query.

.PARAMETER ConfigDirectory
    The directory containing the configuration files.

.EXAMPLE
    $configs = Get-Configs -ConfigDirectory "path\to\config\directory"
    foreach ($config in $configs) {
        # Process each config
    }

.OUTPUTS
    Array of PSCustomObject representing the configurations.
#>
function Get-Configs {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ConfigDirectory
    )

    $configFiles = Get-ChildItem -Path $ConfigDirectory -Filter *.json

    $configs = @()
    foreach ($configFile in $configFiles) {
        $configContent = Get-Content -Path $configFile.FullName -Raw | ConvertFrom-Json
        $configs += $configContent
    }

    return $configs
}

Export-ModuleMember -Function Get-Configs
