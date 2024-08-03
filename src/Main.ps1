# scripts/Main.ps1

# Define the paths
$basePath = $PSScriptRoot
$configFilePath = Join-Path -Path $basePath -ChildPath "config.json"

# Initialize both modules
& "$basePath\scripts\InitializeModules.ps1" -BasePath $basePath

# Read configuration
$config = & "$basePath\scripts\ReadConfiguration.ps1" -ConfigFilePath $configFilePath

# Execute Power BI actions
$results = & "$basePath\scripts\ExecuteActions.ps1" -ConfigDirectory (Join-Path -Path $basePath -ChildPath $config.configDirectory) -OutputDirectory (Join-Path -Path $basePath -ChildPath $config.outputDirectory)

# Log the results
& "$basePath\scripts\LogResults.ps1" -Results $results -LogFilePath (Join-Path -Path $basePath -ChildPath $config.logFilePath)

# Visualize logs and report data
& "$basePath\scripts\VisualizeData.ps1" -LogFilePath (Join-Path -Path $basePath -ChildPath $config.logFilePath) -DataFilePath (Join-Path -Path $basePath -ChildPath "data/example-report.csv") -VisualizationOutputPath (Join-Path -Path $basePath -ChildPath "visualizations/output/logs.html") -DataVisualizationOutputPath (Join-Path -Path $basePath -ChildPath "visualizations/output/report.html")