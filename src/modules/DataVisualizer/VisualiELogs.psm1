# modules/DataVisualizer/VisualizeLogs.psm1

<#
.SYNOPSIS
    Visualizes log files created by the PowerBiManager.

.DESCRIPTION
    This module provides functions to read and visualize log files, creating HTML or Excel reports.

.PARAMETER LogFilePath
    The path to the log file.

.PARAMETER OutputFormat
    The format for the output visualization (HTML or Excel).

.PARAMETER OutputPath
    The path where the visualization will be saved.

.EXAMPLE
    Visualize-Logs -LogFilePath "logs/logfile.log" -OutputFormat "HTML" -OutputPath "visualizations/output/logs.html"

.OUTPUTS
    Visualization file in specified format.
#>
function Visualize-Logs {
    param (
        [Parameter(Mandatory = $true)]
        [string]$LogFilePath,

        [Parameter(Mandatory = $true)]
        [string]$OutputFormat,

        [Parameter(Mandatory = $true)]
        [string]$OutputPath
    )

    # Read log file
    $logs = Get-Content -Path $LogFilePath | ForEach-Object {
        $fields = $_ -split ' - '
        [pscustomobject]@{
            Timestamp = $fields[0]
            Action    = $fields[1]
            Details   = $fields[2]
        }
    }

    # Generate visualization based on format
    if ($OutputFormat -eq "HTML") {
        $htmlContent = "<html><body><h1>Log Visualization</h1><table border='1'><tr><th>Timestamp</th><th>Action</th><th>Details</th></tr>"
        foreach ($log in $logs) {
            $htmlContent += "<tr><td>$($log.Timestamp)</td><td>$($log.Action)</td><td>$($log.Details)</td></tr>"
        }
        $htmlContent += "</table></body></html>"
        Set-Content -Path $OutputPath -Value $htmlContent
    } elseif ($OutputFormat -eq "Excel") {
        $excel = New-Object -ComObject Excel.Application
        $excel.Visible = $false
        $workbook = $excel.Workbooks.Add()
        $worksheet = $workbook.Worksheets.Item(1)
        
        $worksheet.Cells.Item(1,1) = "Timestamp"
        $worksheet.Cells.Item(1,2) = "Action"
        $worksheet.Cells.Item(1,3) = "Details"
        
        $row = 2
        foreach ($log in $logs) {
            $worksheet.Cells.Item($row,1) = $log.Timestamp
            $worksheet.Cells.Item($row,2) = $log.Action
            $worksheet.Cells.Item($row,3) = $log.Details
            $row++
        }
        
        $workbook.SaveAs($OutputPath)
        $excel.Quit()
    } else {
        throw "Unsupported output format: $OutputFormat"
    }
}

Export-ModuleMember -Function Visualize-Logs