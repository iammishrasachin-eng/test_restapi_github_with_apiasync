$ErrorActionPreference = "Stop"
$deploy = "C:\inetpub\test_restapi_github_withasyncapi"
$zip    = "C:\temp\app.zip"

# App ko offline karo taaki DLL lock chhoot jaaye
New-Item -Path "$deploy\app_offline.htm" -ItemType File -Force | Out-Null
Start-Sleep -Seconds 3

# Extract
Expand-Archive -Path $zip -DestinationPath $deploy -Force

# Wapas online
Remove-Item "$deploy\app_offline.htm" -Force
Remove-Item $zip -Force

Write-Host "Deploy complete."