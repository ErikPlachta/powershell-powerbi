# modules/PowerBiManager/modules/Set-ReportResults.psm1

<#
.SYNOPSIS
    Processes and saves the results of a Power BI report query.

.DESCRIPTION
    This module provides functions to process and save the results of a Power BI report query.

.PARAMETER ResultData
    The result data from the report query.

.PARAMETER OutputPath
    The path where the results will be saved.

.EXAMPLE
    Set-ReportResults -ResultData $data -OutputPath "path/to/output"
#>
function Set-ReportResults {
    param (
        [Parameter(Mandatory = $true)]
        $ResultData,

        [Parameter(Mandatory = $true)]
        [string]$OutputPath
    )

    # Save the result data as JSON
    $json = $ResultData | ConvertTo-Json -Depth 10
    Set-Content -Path $OutputPath -Value $json
}

Export-ModuleMember -Function Set-ReportResults
