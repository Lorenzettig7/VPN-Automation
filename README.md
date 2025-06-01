#VPN Security Policy Enforcement Script

This PowerShell script is designed to enhance endpoint VPN security on Windows systems by:

- Disabling split tunneling
- Enforcing a session timeout (default: 30 minutes)

These policies help reduce lateral movement and ensure idle VPN sessions don’t remain open indefinitely.
Run as Administrator. Designed for local use or GPO deployment.
---

## Script: `Set-VPNPolicy.ps1`

```powershell
# Set VPN session timeout (30 minutes)
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\RasMan\Config" -Name "IdleTimeout" -Value 1800

# Disable split tunneling
Get-VpnConnection | ForEach-Object {
    Set-VpnConnection -Name $_.Name -SplitTunneling $false -Force
}

