# modules/PowerBiManager/ExecuteReport.psm1

<#
.SYNOPSIS
    Executes a Power BI report with optional query parameters.

.DESCRIPTION
    This function executes a Power BI report in a specified workspace with optional query parameters.

.PARAMETER WorkspaceId
    The ID of the Power BI workspace containing the report.

.PARAMETER ReportId
    The ID of the Power BI report to be executed.

.PARAMETER QueryParameters
    A hashtable of query parameters to be passed to the report. Default is an empty hashtable.

.EXAMPLE
    Execute-Report -WorkspaceId "workspace-id" -ReportId "report-id" -QueryParameters @{ Parameter1 = "Value1" }

.OUTPUTS
    JSON object containing the execution result.
#>
function Execute-Report {
    param (
        [string]$WorkspaceId,
        [string]$ReportId,
        [hashtable]$QueryParameters = @{}
    )

    # Convert query parameters to JSON
    $queryParametersJson = $QueryParameters | ConvertTo-Json

    # Execute the report query with parameters
    $response = Invoke-PowerBIRestMethod -Url "groups/$WorkspaceId/reports/$ReportId/executeQueries" -Method Post -Body $queryParametersJson -ContentType "application/json"

    # Output the response
    return $response | ConvertFrom-Json
}

Export-ModuleMember -Function Execute-Report
