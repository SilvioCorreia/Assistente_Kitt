$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

if (-not (Test-Path .venv)) {
    py -3 -m venv .venv
}

. .\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

Write-Host "Setup complete. Use 'python agent.py local' to test locally or 'python agent.py console' for the full runtime." -ForegroundColor Green
