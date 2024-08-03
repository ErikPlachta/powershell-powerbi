# modules/PowerBiManager/modules/CheckDependencies.psm1

<#
.SYNOPSIS
    Checks if required dependencies are installed.

.DESCRIPTION
    This script checks if required dependencies are installed, prompts the user to install missing dependencies,
    and returns true if all dependencies are installed, and false otherwise.

.PARAMETER Dependencies
    A list of module names that are required.

.EXAMPLE
    $result = Test-Dependencies -Dependencies @('MicrosoftPowerBIMgmt')

.OUTPUTS
    Boolean indicating if all dependencies are installed.
#>
function Test-Dependencies {
    param (
        [Parameter(Mandatory = $true)]
        [string[]]$Dependencies
    )

    $allInstalled = $true
    $missingModules = @()

    foreach ($module in $Dependencies) {
        if (-not (Get-Module -ListAvailable -Name $module)) {
            $missingModules += $module
        }
    }

    if ($missingModules.Count -eq 0) {
        return $true
    }

    Write-Host "The following required modules are missing: $($missingModules -join ', ')"
    $response = Read-Host "Would you like to install them now? (Y/N)"

    if ($response -match '^[Yy]$') {
        foreach ($module in $missingModules) {
            try {
                Install-Module -Name $module -Force -Scope CurrentUser
            } catch {
                Write-Host "Failed to install module: $module"
                $allInstalled = $false
            }
        }
    } else {
        $allInstalled = $false
    }

    return $allInstalled
}

Export-ModuleMember -Function Test-Dependencies
