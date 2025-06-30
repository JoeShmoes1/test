@echo off
echo ===========================================
echo   Goal Planner Application Startup
echo ===========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python not found. Please install Python 3.7+ from https://python.org
    pause
    exit /b 1
)

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js not found. Please install Node.js 16+ from https://nodejs.org
    pause
    exit /b 1
)

echo Python and Node.js found!
echo.

REM Check if dependencies are installed
if not exist "node_modules" (
    echo Installing Node.js dependencies...
    npm install
    if %errorlevel% neq 0 (
        echo ERROR: Failed to install Node.js dependencies
        pause
        exit /b 1
    )
)

echo.
echo Choose startup method:
echo 1. Start everything together (Recommended)
echo 2. Show manual startup instructions
echo 3. Test backend only
echo.
set /p choice="Enter your choice (1-3): "

if "%choice%"=="1" (
    echo Starting all components...
    npm run dev:full
) else if "%choice%"=="2" (
    echo.
    echo Manual startup instructions:
    echo.
    echo Terminal 1 - Start Backend:
    echo   npm run start:backend
    echo.
    echo Terminal 2 - Start React:
    echo   npm run start:react
    echo.
    echo Terminal 3 - Start Electron:
    echo   npm run start:electron
    echo.
    pause
) else if "%choice%"=="3" (
    echo.
    echo Testing backend functionality...
    echo Make sure to start the backend first in another terminal:
    echo   npm run start:backend
    echo.
    pause
    python test_backend.py
    pause
) else (
    echo Invalid choice. Exiting.
    pause
    exit /b 1
)
