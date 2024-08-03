# modules/PowerBiManager/main.ps1

<#
.SYNOPSIS
    Initializes the PowerBiManager module.

.DESCRIPTION
    This script imports all submodules, checks dependencies, and exports their functions to initialize the PowerBiManager module.
#>

# Import all submodules
$submodulesPath = Join-Path -Path $PSScriptRoot -ChildPath "modules"
Import-Module (Join-Path -Path $submodulesPath -ChildPath "CheckDependencies.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "ExecuteReport.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "GetReportMeta.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "ProcessReportResults.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "ConfigReader.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Logger.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Setup.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "ExecuteDax.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "ExecuteActions.psm1")

# Check dependencies
$dependencies = @('MicrosoftPowerBIMgmt')
if (-not (Test-Dependencies -Dependencies $dependencies)) {
    throw "Required dependencies are not installed. Please install them and try again."
}

# Define the exported functions
Export-ModuleMember -Function Execute-Report
Export-ModuleMember -Function Get-ReportMetadata
Export-ModuleMember -Function Process-ReportResults
Export-ModuleMember -Function Get-Configs
Export-ModuleMember -Function Write-Log
Export-ModuleMember -Function Initialize-PowerBiManager
Export-ModuleMember -Function Execute-DaxQuery
Export-ModuleMember -Function Test-Dependencies
Export-ModuleMember -Function Execute-Actions
