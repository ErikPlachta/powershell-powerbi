# modules/PowerBiManager/PowerBiManager.psd1

@{
    # Script module or binary module file associated with this manifest.
    RootModule = 'PowerBiManager.psm1'

    # Version number of this module.
    ModuleVersion = '0.0.1'

    # ID used to uniquely identify this module
    GUID = 'd4b0eac4-9835-4a4f-b8e3-112b647fa5f2'

    # Author of this module
    Author = 'Erik Plachta'

    # Company or vendor of this module
    CompanyName = $false

    # Copyright statement for this module
    Copyright = '(c) 2024 Erik Plachta. All rights reserved.'

   # Description of the functionality provided by this module
    Description = 'This module contains functions for managing and executing Power BI reports and datasets.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'

    # Modules that must be imported into the global environment prior to importing this module
    #RequiredModules = @('MicrosoftPowerBIMgmt')
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
    NestedModules = @()

    # Functions to export from this module
    FunctionsToExport = @(
        'Start-SetupPowerBiManager',
        'Get-Config',
        'Get-Dependencies',
        'Set-Log',
        'Invoke-Action',
        'Invoke-DaxQuery',
        'Invoke-ReportQuery',
        'Get-ReportMeta',
        'Set-ReportResults',
        "Invoke-PowerBiLogin",
        "Get-PowerBiAuthState",
        "Invoke-PowerBiLogout"
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

    # End of module manifest definition
}
