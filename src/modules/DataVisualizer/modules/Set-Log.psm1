# modules/DataVisualizer/Set-Log.psm1

<#
.SYNOPSIS
    Provides logging functionality.

.DESCRIPTION
    This module provides a function to log messages to a specified log file.

.PARAMETER Path
    The path to the log file.

.PARAMETER Message
    The message to log.

.EXAMPLE
    Set-Log -Path "logs/logfile.log" -Message "This is a log message."
#>
function Set-Log {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "$timestamp - $Message"
    Add-Content -Path $Path -Value $logMessage
}

Export-ModuleMember -Function Set-Log
