Import-Module Webadministration
Cls
$env:COMPUTERNAME | Out-File -Filepath $env:COMPUTERNAME"_ReportCertificates.txt"
Write-Host "List of IIS Sites and Bindings"  | Out-File -Filepath $env:COMPUTERNAME"_ReportCertificates.txt" -Append
Write-Host "==============================" | Out-File -Filepath $env:COMPUTERNAME"_ReportCertificates.txt" -Append
Get-ChildItem -Path IIS:\Sites | format-table  | Out-File -Filepath $env:COMPUTERNAME"_ReportCertificates.txt" -Append
Write-Host "List of Certificates and Exp Dates" | Out-File -Filepath $env:COMPUTERNAME"_ReportCertificates.txt" -Append
Write-Host "==================================" | Out-File -Filepath $env:COMPUTERNAME"_ReportCertificates.txt" -Append
Get-ChildItem Cert:\LocalMachine\My | format-table -Property Subject, NotAfter, Thumbprint  | Out-File -Filepath $env:COMPUTERNAME"_ReportCertificates.txt" -Append
