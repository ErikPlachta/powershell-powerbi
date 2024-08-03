# modules/DataVisualizer/DataVisualizer.psd1

@{
    # Script module or binary module file associated with this manifest.
    RootModule = ''

    # Version number of this module.
    ModuleVersion = '1.0.0'

    # ID used to uniquely identify this module
    GUID = 'b85b7a8c-92f0-4c1a-9c28-fbd9c307b6c0'

    # Author of this module
    Author = 'Your Name'

    # Company or vendor of this module
    CompanyName = 'Your Company'

    # Copyright statement for this module
    Copyright = '(c) 2023 Your Company. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'This module contains functions for visualizing logs and report data from PowerBiManager.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    NestedModules = @(
        'VisualizeLogs.psm1',
        'VisualizeData.psm1',
        'ConfigReader.psm1',
        'Logger.psm1',
        'Setup.psm1'
    )

    # Functions to export from this module
    FunctionsToExport = @(
        'Visualize-Logs',
        'Visualize-Data',
        'Get-Config',
        'Write-Log',
        'Initialize-DataVisualizer'
    )

    # Cmdlets to export from this module
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module
    AliasesToExport = @()

    # DscResources to export from this module
    DscResourcesToExport = @()

    # List of all modules packaged with this module
    FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess
    PrivateData = @{}

    # Metadata used to uniquely identify this module
    HelpInfoURI = ''

    # Tags to help search for this module
    Tags = @()

    # External module dependencies
    ExternalModuleDependencies = @()

    # End of module manifest definition
}