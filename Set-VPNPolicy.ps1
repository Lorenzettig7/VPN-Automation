# Set VPN session timeout (e.g., 30 minutes)
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\RasMan\Config" -Name "IdleTimeout" -Value 1800

# Disable split tunneling for all VPN connections
Get-VpnConnection | ForEach-Object {
    Set-VpnConnection -Name $_.Name -SplitTunneling $false -Force
}
