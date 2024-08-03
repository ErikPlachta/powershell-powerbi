# modules/DataVisualizer/Set-VisualizedData.psm1

<#
.SYNOPSIS
    Visualizes data exported from Power BI reports.

.DESCRIPTION
    This module provides functions to read and visualize data from exported reports, creating HTML or Excel reports.

.PARAMETER Path
    The path to the data file.

.PARAMETER OutputFormat
    The format for the output visualization (HTML or Excel).

.PARAMETER OutputPath
    The path where the visualization will be saved.

.EXAMPLE
    Set-VisualizedData -Path "data/example-report.csv" -OutputFormat "HTML" -OutputPath "visualizations/output/report.html"

.OUTPUTS
    Visualization file in specified format.
#>
function Set-VisualizedData {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$OutputFormat,

        [Parameter(Mandatory = $true)]
        [string]$OutputPath
    )

    # Read data file
    $data = Import-Csv -Path $Path

    # Generate visualization based on format
    if ($OutputFormat -eq "HTML") {
        $htmlContent = "<html><body><h1>Data Visualization</h1><table border='1'><tr>"
        foreach ($header in $data[0].PSObject.Properties.Name) {
            $htmlContent += "<th>$header</th>"
        }
        $htmlContent += "</tr>"
        foreach ($row in $data) {
            $htmlContent += "<tr>"
            foreach ($header in $data[0].PSObject.Properties.Name) {
                $htmlContent += "<td>$($row.$header)</td>"
            }
            $htmlContent += "</tr>"
        }
        $htmlContent += "</table></body></html>"
        Set-Content -Path $OutputPath -Value $htmlContent
    } elseif ($OutputFormat -eq "Excel") {
        $excel = New-Object -ComObject Excel.Application
        $excel.Visible = $false
        $workbook = $excel.Workbooks.Add()
        $worksheet = $workbook.Worksheets.Item(1)
        
        $headers = $data[0].PSObject.Properties.Name
        $col = 1
        foreach ($header in $headers) {
            $worksheet.Cells.Item(1, $col) = $header
            $col++
        }

        $row = 2
        foreach ($record in $data) {
            $col = 1
            foreach ($header in $headers) {
                $worksheet.Cells.Item($row, $col) = $record.$header
                $col++
            }
            $row++
        }

        $workbook.SaveAs($OutputPath)
        $excel.Quit()
    } else {
        throw "Unsupported output format: $OutputFormat"
    }
}

Export-ModuleMember -Function Set-VisualizedData
