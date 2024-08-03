# modules/PowerBiManager/ProcessReportResults.psm1

<#
.SYNOPSIS
    Processes the execution results of a Power BI report.

.DESCRIPTION
    This function processes the execution results of a Power BI report, providing information about the number of rows, number of columns, column names, and data types.

.PARAMETER ExecutionResult
    The result of the report execution.

.EXAMPLE
    Process-ReportResults -ExecutionResult $executionResult

.OUTPUTS
    PSCustomObject containing the processed result details.
#>
function Process-ReportResults {
    param (
        [Parameter(Mandatory = $true)]
        [pscustomobject]$ExecutionResult
    )

    $columns = $ExecutionResult.Tables[0].Columns

    $result = [pscustomobject]@{
        NumberOfRows   = $ExecutionResult.Tables[0].Rows.Count
        NumberOfColumns = $columns.Count
        Columns        = @()
    }

    foreach ($column in $columns) {
        $result.Columns += [pscustomobject]@{
            Name     = $column.Name
            DataType = $column.DataType
        }
    }

    return $result
}

Export-ModuleMember -Function Process-ReportResults
