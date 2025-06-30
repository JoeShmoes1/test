@echo off
echo 🚀 Starting Wikipedia Search Backend...
echo ==========================================

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python is not installed or not in PATH
    echo Trying py launcher...
    py --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo ❌ Python is not available
        echo Please install Python 3.8+ from https://python.org
        pause
        exit /b 1
    ) else (
        echo ✅ Python detected via py launcher
        set PYTHON_CMD=py
    )
) else (
    echo ✅ Python detected
    set PYTHON_CMD=python
)

REM Change to backend directory
cd /d "%~dp0\backend"

REM Install dependencies
echo Installing Python dependencies...
%PYTHON_CMD% -m pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo ❌ Failed to install dependencies
    pause
    exit /b 1
)

echo ✅ Dependencies installed successfully

REM Start the backend server
echo Starting backend server on http://localhost:5000...
echo Press Ctrl+C to stop the server
echo.
%PYTHON_CMD% app.py

pause
