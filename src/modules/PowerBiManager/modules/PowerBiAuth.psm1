# modules/PowerBiManager/modules/PowerBiLogin.psm1

<#
.SYNOPSIS
    Manages login, verify login status, and logout to Power BI.

.DESCRIPTION
    This module provides functions to login, verify if logged in, and log out from Power BI using MicrosoftPowerBIMgmt.

.EXAMPLE
    Invoke-PowerBiLogin
    Get-PowerBiAuthState
    Invoke-PowerBiLogout
#>

function Invoke-PowerBiLogin {
    <#
    .SYNOPSIS
        Logs in to Power BI.

    .DESCRIPTION
        This function logs in to Power BI using the MicrosoftPowerBIMgmt module.
    #>
    try {
        Connect-PowerBIServiceAccount
        Write-Host "Logged in to Power BI."
    } catch {
        Write-Host "Failed to log in to Power BI. Error: $_"
    }
}

function Get-PowerBiAuthState {
    <#
    .SYNOPSIS
        Verifies if the user is logged in to Power BI.

    .DESCRIPTION
        This function checks if the user is currently logged in to Power BI.
    
    .OUTPUTS
        Boolean indicating if the user is logged in.
    #>
    try {
        $account = Get-PowerBIServiceAccount
        if ($account) {
            Write-Host "User is logged in to Power BI."
            return $true
        } else {
            Write-Host "User is not logged in to Power BI."
            return $false
        }
    } catch {
        Write-Host "Failed to verify login status. Error: $_"
        return $false
    }
}

function Invoke-PowerBiLogout {
    <#
    .SYNOPSIS
        Logs out from Power BI.

    .DESCRIPTION
        This function logs out from Power BI using the MicrosoftPowerBIMgmt module.
    #>
    try {
        Disconnect-PowerBIServiceAccount
        Write-Host "Logged out from Power BI."
    } catch {
        Write-Host "Failed to log out from Power BI. Error: $_"
    }
}

Export-ModuleMember -Function Invoke-PowerBiLogin, Get-PowerBiAuthState, Invoke-PowerBiLogout
