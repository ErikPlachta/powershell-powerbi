# modules/PowerBiManager/ExecuteDax.psm1

<#
.SYNOPSIS
    Executes a DAX query against a Power BI dataset.

.DESCRIPTION
    This function executes a DAX query against a specified Power BI dataset and retrieves the results.

.PARAMETER WorkspaceId
    The ID of the Power BI workspace containing the dataset.

.PARAMETER DatasetId
    The ID of the Power BI dataset to query.

.PARAMETER DaxQuery
    The DAX query to be executed.

.EXAMPLE
    $result = Execute-DaxQuery -WorkspaceId "workspace-id" -DatasetId "dataset-id" -DaxQuery "EVALUATE SUMMARIZECOLUMNS(..."

.OUTPUTS
    JSON object containing the query result.
#>
function Execute-DaxQuery {
    param (
        [Parameter(Mandatory = $true)]
        [string]$WorkspaceId,

        [Parameter(Mandatory = $true)]
        [string]$DatasetId,

        [Parameter(Mandatory = $true)]
        [string]$DaxQuery
    )

    # Construct the request body
    $body = @{
        "queries" = @(
            @{
                "query" = $DaxQuery
            }
        )
        "serializerSettings" = @{
            "includeNulls" = "true"
        }
    } | ConvertTo-Json -Depth 10

    # Execute the DAX query
    $response = Invoke-PowerBIRestMethod -Url "groups/$WorkspaceId/datasets/$DatasetId/executeQueries" -Method Post -Body $body -ContentType "application/json"

    # Output the response
    return $response | ConvertFrom-Json
}

Export-ModuleMember -Function Execute-DaxQuery
