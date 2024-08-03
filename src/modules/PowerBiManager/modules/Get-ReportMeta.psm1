# modules/PowerBiManager/GetReportMeta.psm1

<#
.SYNOPSIS
    Retrieves metadata for a specified Power BI report.

.DESCRIPTION
    This function retrieves metadata for a Power BI report in a specified workspace, including last modified by, created by, last modified date, created date, and subscription details.

.PARAMETER WorkspaceId
    The ID of the Power BI workspace containing the report.

.PARAMETER ReportId
    The ID of the Power BI report for which metadata is to be retrieved.

.EXAMPLE
    Get-ReportMetadata -WorkspaceId "workspace-id" -ReportId "report-id"

.OUTPUTS
    PSCustomObject containing the report metadata.
#>
function Get-ReportMetadata {
    param (
        [string]$WorkspaceId,
        [string]$ReportId
    )

    $reportActivity = Invoke-PowerBIRestMethod -Url "groups/$WorkspaceId/reports/$ReportId" -Method Get -ContentType "application/json"
    $reportSubscriptions = Invoke-PowerBIRestMethod -Url "groups/$WorkspaceId/reports/$ReportId/subscriptions" -Method Get -ContentType "application/json"

    return [pscustomobject]@{
        ReportId           = $ReportId
        Name               = $reportActivity.name
        LastModifiedBy     = $reportActivity.modifiedBy
        LastModifiedDate   = $reportActivity.modifiedDate
        CreatedBy          = $reportActivity.createdBy
        CreatedDate        = $reportActivity.createdDate
        SubscriptionCount  = ($reportSubscriptions.value | Measure-Object).Count
        Subscriptions      = $reportSubscriptions.value
    }
}

Export-ModuleMember -Function Get-ReportMetadata
