# scripts/TestDataVisualizer.ps1

<#
.SYNOPSIS
    Tests the DataVisualizer module by executing predefined actions.

.DESCRIPTION
    This script tests the DataVisualizer module by executing actions defined in configuration files.

.EXAMPLE
    .\TestDataVisualizer.ps1
#>

# Define the paths
$basePath = $PSScriptRoot
$modulePath = Join-Path -Path $basePath -ChildPath "../DataVisualizer"
$actionConfigsPath = Join-Path -Path $modulePath -ChildPath ".bin/tests/actions"

# Import the DataVisualizer module
Import-Module $modulePath -verbose

try {

    Start-SetupDataVisualizer -BasePath $modulePath 

    $ConfigPath = Join-Path -Path $modulePath -ChildPath ".bin/config.json"

    # Load the configuration file
    $config = Get-Content -Path $ConfigPath | ConvertFrom-Json

    #write-host $modulePath
    #write-host $config
    #write-host $config.LogPath
    #write-host $config.OutputPath
    #write-host $config.ActionPath

    $DataPath = "$($basePath)\.bin\tests\data"
    $LogPath = "$($basePath)\.bin\tests\logs"
    $OutputPath = "$($basePath)\$($config.OutputPath)"

    #write-host $LogPath
    #write-host $OutputPath

    #return 

    # Execute visualize logs action
    $visualizeLogsConfig = Join-Path -Path $actionConfigsPath -ChildPath "logsToHtml.json"
    Invoke-Action -ActionConfig $visualizeLogsConfig -BasePath $LogPath -OutputPath $OutputPath

    # Execute visualize data action
    $visualizeDataConfig = Join-Path -Path $actionConfigsPath -ChildPath "dataToHtml_json.json"
    Invoke-Action -ActionConfig $visualizeDataConfig -BasePath $DataPath -OutputPath $OutputPath

     # Execute visualize data action
    $visualizeDataConfig = Join-Path -Path $actionConfigsPath -ChildPath "dataToHtml_json.json"
    Invoke-Action -ActionConfig $visualizeDataConfig -BasePath $DataPath -OutputPath $OutputPath

    Write-Host "DataVisualizer module tests completed."
} finally {
    # Cleanup temporary files if they exist
    $tempFilePath = Join-Path -Path $basePath -ChildPath "tempCodeRunnerFile.ps1"
    if (Test-Path $tempFilePath) {
        Remove-Item -Path $tempFilePath -Force
        Write-Host "Temporary file removed: $tempFilePath"
    }
}
