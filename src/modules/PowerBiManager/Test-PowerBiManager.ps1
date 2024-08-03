# modules/PowerBiManager/Test-PowerBiManager.ps1

<#
.SYNOPSIS
    Tests the PowerBiManager module by executing predefined actions.

.DESCRIPTION
    This script tests the PowerBiManager module by executing actions defined in configuration files.

.EXAMPLE
    .\Test-PowerBiManager.ps1
#>

# Define the paths
$basePath = $PSScriptRoot
$modulePath = Join-Path -Path $basePath -ChildPath "../PowerBiManager"
$actionsPath = Join-Path -Path $modulePath -ChildPath ".bin/tests/actions"
$outputPath = Join-Path -Path $modulePath -ChildPath ".bin/output"

# Import the PowerBiManager module
Import-Module $modulePath -Verbose

try {
    # Create base architecture
    Start-SetupPowerBiManager -BasePath $modulePath

    
    # Login to Power BI
    Invoke-PowerBiLogin

    # Verify login status
    if (-not (Get-PowerBiAuthState)) {
        throw "Login to Power BI failed."
    }

    # Load the configuration file
    $configPath = "$($modulePath)/.bin/config.json"
    $config = Get-Config -Path $configPath

    # Execute DAX query action
    $daxQueryConfig = Join-Path -Path $actionsPath -ChildPath "test-dax.json"
    #Invoke-Action -ActionConfig $daxQueryConfig -BasePath $modulePath -OutputPath $outputPath
    # TODO: Add DAX processing logic fix

    # Execute single report query action
    $reportQueryConfigPath = Join-Path -Path $actionsPath -ChildPath "test-report.json"
    Invoke-Action -ActionConfig $reportQueryConfigPath -BasePath $modulePath -OutputPath $outputPath
    
    #$reportQueryConfig = Get-Config -Path $reportQueryConfigPath
    #$reportQueryConfig = Get-Content -Path $reportQueryConfigPath | ConvertFrom-Json
    #Invoke-Action -ActionConfig $reportQueryConfig -BasePath $modulePath -OutputPath $outputPath
    # TODO: Add real reports I can test against from microsoft power bi sample data

    # Execute multiple reports query action
    $reportsQueryConfig = Join-Path -Path $actionsPath -ChildPath "test-reports.json"
    #Invoke-Action -ActionConfig $reportsQueryConfig -BasePath $modulePath -OutputPath $outputPath

    Write-Host "PowerBiManager module tests completed."
} finally {

        
    # Logout from Power BI aattempt always, even if never logged in.
    Invoke-PowerBiLogout

    # Cleanup temporary files if they exist
    $tempFilePath = Join-Path -Path $basePath -ChildPath "tempCodeRunnerFile.ps1"
    if (Test-Path $tempFilePath) {
        Remove-Item -Path $tempFilePath -Force
        Write-Host "Temporary file removed: $tempFilePath"
    }
}
