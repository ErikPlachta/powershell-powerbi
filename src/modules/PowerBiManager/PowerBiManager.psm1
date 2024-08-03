# modules/PowerBiManager/PowerBiManager.psm1

<#
.SYNOPSIS
    Initializes the PowerBiManager module.

.DESCRIPTION
    This script imports all submodules and exports their functions to initialize the PowerBiManager module.
#>

# Import all submodules
$submodulesPath = Join-Path -Path $PSScriptRoot -ChildPath "modules"
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Start-SetupPowerBiManager.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Get-Config.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Get-Dependencies.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Set-Log.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Invoke-Action.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Invoke-DaxQuery.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Invoke-ReportQuery.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Get-ReportMeta.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Set-ReportResults.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Invoke-Action.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Invoke-PowerBIRestMethod.psm1")
# Power BI Authentication
Import-Module (Join-Path -Path $submodulesPath -ChildPath "powerBiAuth.psm1")

# Define the exported functions
Export-ModuleMember -Function Start-SetupPowerBiManager
Export-ModuleMember -Function Get-Config
Export-ModuleMember -Function Get-Dependencies
Export-ModuleMember -Function Set-Log
Export-ModuleMember -Function Invoke-Action
Export-ModuleMember -Function Invoke-DaxQuery
Export-ModuleMember -Function Invoke-ReportQuery
Export-ModuleMember -Function Get-ReportMeta
Export-ModuleMember -Function Set-ReportResults
Export-ModuleMember -Function Invoke-PowerBiLogin, Get-PowerBiAuthState, Invoke-PowerBiLogout