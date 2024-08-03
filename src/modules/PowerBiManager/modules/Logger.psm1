# modules/PowerBiManager/Logger.psm1

<#
.SYNOPSIS
    Provides logging functionality.

.DESCRIPTION
    This module provides a function to log messages to a specified log file.

.PARAMETER LogFilePath
    The path to the log file.

.PARAMETER Message
    The message to log.

.EXAMPLE
    Write-Log -LogFilePath "logs/logfile.log" -Message "This is a log message."
#>
function Write-Log {
    param (
        [Parameter(Mandatory = $true)]
        [string]$LogFilePath,

        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "$timestamp - $Message"
    Add-Content -Path $LogFilePath -Value $logMessage
}

Export-ModuleMember -Function Write-Log
