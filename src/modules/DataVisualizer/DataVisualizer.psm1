# modules/DataVisualizer/main.ps1

<#
.SYNOPSIS
    Initializes the DataVisualizer module.

.DESCRIPTION
    This script imports all submodules and exports their functions to initialize the DataVisualizer module.
#>

# Import all submodules
$submodulesPath = Join-Path -Path $PSScriptRoot -ChildPath "modules"
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Set-VisualizedLogs.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Set-VisualizedData.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Get-Config.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Set-Log.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Start-SetupDataVisualizer.psm1")
Import-Module (Join-Path -Path $submodulesPath -ChildPath "Invoke-Action.psm1")

# Define the exported functions
Export-ModuleMember -Function Set-VisualizedLogs
Export-ModuleMember -Function Set-VisualizeData
Export-ModuleMember -Function Get-Config
Export-ModuleMember -Function Set-Log
Export-ModuleMember -Function Start-SetupDataVisualizer
Export-ModuleMember -Function invoke-Action
