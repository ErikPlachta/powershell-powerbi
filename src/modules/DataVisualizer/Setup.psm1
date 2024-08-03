# modules/DataVisualizer/Setup.psm1

<#
.SYNOPSIS
    Provides setup functionality for DataVisualizer.

.DESCRIPTION
    This module provides functions to create necessary folder structures, import templates, and handle other setup requirements.

.PARAMETER BasePath
    The base path where the setup will be performed.

.EXAMPLE
    Initialize-DataVisualizer -BasePath $PSScriptRoot
#>
function Initialize-DataVisualizer {
    param (
        [Parameter(Mandatory = $true)]
        [string]$BasePath
    )

    # Define required directories
    $requiredDirectories = @(
        "data",
        "logs",
        "visualizations/templates",
        "visualizations/output"
    )

    # Create directories
    foreach ($dir in $requiredDirectories) {
        $fullPath = Join-Path -Path $BasePath -ChildPath $dir
        if (-not (Test-Path -Path $fullPath)) {
            New-Item -Path $fullPath -ItemType Directory -Force
        }
    }

    # Import default templates
    $templatePath = Join-Path -Path $BasePath -ChildPath "visualizations/templates"
    $defaultTemplate = @"
<html>
<head>
    <title>Default Template</title>
</head>
<body>
    <h1>Data Visualization</h1>
</body>
</html>
"@
    $templateFile = Join-Path -Path $templatePath -ChildPath "default.html"
    if (-not (Test-Path -Path $templateFile)) {
        Set-Content -Path $templateFile -Value $defaultTemplate
    }
}

Export-ModuleMember -Function Initialize-DataVisualizer