# Goal Planner Application Startup Script
# This script starts all components of the Goal Planner application

Write-Host "🚀 Starting Goal Planner Application..." -ForegroundColor Green
Write-Host "=" * 50

# Check if Python is installed
try {
    $pythonVersion = python --version 2>$null
    Write-Host "✅ Python found: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Python not found. Please install Python 3.7+ from https://python.org" -ForegroundColor Red
    exit 1
}

# Check if Node.js is installed
try {
    $nodeVersion = node --version 2>$null
    Write-Host "✅ Node.js found: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js not found. Please install Node.js 16+ from https://nodejs.org" -ForegroundColor Red
    exit 1
}

# Check if dependencies are installed
if (!(Test-Path "node_modules")) {
    Write-Host "📦 Installing Node.js dependencies..." -ForegroundColor Yellow
    npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Failed to install Node.js dependencies" -ForegroundColor Red
        exit 1
    }
}

# Check if Python dependencies are installed
if (!(Test-Path "backend\venv") -and !(Get-Command pip -ErrorAction SilentlyContinue)) {
    Write-Host "🐍 Installing Python dependencies..." -ForegroundColor Yellow
    Set-Location backend
    pip install -r requirements.txt
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Failed to install Python dependencies" -ForegroundColor Red
        Set-Location ..
        exit 1
    }
    Set-Location ..
}

Write-Host "🎯 All dependencies ready!" -ForegroundColor Green
Write-Host ""

# Ask user which startup method they prefer
Write-Host "Choose startup method:" -ForegroundColor Cyan
Write-Host "1. Start everything together (Recommended)" -ForegroundColor White
Write-Host "2. Start components manually" -ForegroundColor White
Write-Host "3. Run backend test only" -ForegroundColor White

$choice = Read-Host "Enter your choice (1-3)"

switch ($choice) {
    "1" {
        Write-Host "🚀 Starting all components..." -ForegroundColor Green
        npm run dev:full
    }
    "2" {
        Write-Host "📖 Manual startup instructions:" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Terminal 1 - Start Backend:" -ForegroundColor Cyan
        Write-Host "  npm run start:backend" -ForegroundColor White
        Write-Host ""
        Write-Host "Terminal 2 - Start React:" -ForegroundColor Cyan
        Write-Host "  npm run start:react" -ForegroundColor White
        Write-Host ""
        Write-Host "Terminal 3 - Start Electron:" -ForegroundColor Cyan
        Write-Host "  npm run start:electron" -ForegroundColor White
        Write-Host ""
        Write-Host "Press any key to continue..."
        Read-Host
    }
    "3" {
        Write-Host "🧪 Testing backend only..." -ForegroundColor Yellow
        Write-Host "Make sure to start the backend first in another terminal:"
        Write-Host "  npm run start:backend"
        Write-Host ""
        Read-Host "Press Enter when backend is running"
        python test_backend.py
    }
    default {
        Write-Host "❌ Invalid choice. Exiting." -ForegroundColor Red
        exit 1
    }
}
