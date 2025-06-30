# Goal Planner Application

## Overview
The Goal Planner application is a desktop app built with Electron, React, and TypeScript that allows users to input their goals and generates tailored questions to help create a personalized plan for achieving those goals. It features multiple specialized rooms including a Wikipedia search integration for research purposes.

## Features
- **Goal Planning**: Interactive goal setting with AI-powered question generation
- **Multiple Room Types**: Specialized environments for different planning aspects
- **Wikipedia Integration**: Research functionality with article search and previews
- **Desktop Application**: Cross-platform Electron app with modern UI
- **Real-time Updates**: Live content updates and seamless navigation
- **Scrollable Content**: Optimized scrolling for all room types and content areas

## Project Structure
```
goal-planner/
├── backend/                    # Python Flask backend for Wikipedia API
│   ├── app.py                 # Main Flask application
│   ├── requirements.txt       # Python dependencies
│   ├── setup.py              # Cross-platform setup script
│   ├── setup.bat             # Windows setup script
│   └── README.md             # Backend documentation
├── src/                       # React TypeScript frontend
│   ├── components/           # React components
│   │   ├── content/         # Content-specific components
│   │   ├── layout/          # Layout components
│   │   └── ui/              # UI components
│   ├── models/              # TypeScript interfaces/types
│   ├── services/            # API and external services
│   ├── utils/               # Utility functions
│   └── App.tsx              # Main React application
├── public/                   # Static assets
├── tests/                    # Test files
├── main.js                   # Electron main process
├── package.json             # Node.js dependencies and scripts
├── tsconfig.json            # TypeScript configuration
└── README.md                # This file
```

## Prerequisites
Before installing the application, ensure you have the following installed:

- **Node.js** (version 16 or higher): [Download from nodejs.org](https://nodejs.org/)
- **Python** (version 3.7 or higher): [Download from python.org](https://python.org/)
- **Git**: [Download from git-scm.com](https://git-scm.com/)

## Installation

### 1. Clone the Repository
```bash
git clone <repository-url>
cd goal-planner
```

### 2. Install Node.js Dependencies
```bash
npm install
```

### 3. Set Up Python Backend
The application requires a Python backend for Wikipedia search functionality.

#### Option A: Automatic Setup (Recommended)
**Windows:**
```bash
cd backend
setup.bat
```

**Mac/Linux:**
```bash
cd backend
python setup.py
```

#### Option B: Manual Setup
```bash
cd backend
pip install -r requirements.txt
```

### 4. Verify Installation
Test that all components are properly installed:
```bash
# Test Node.js dependencies
npm run build

# Test Python backend
cd backend
python app.py
# Should show "Flask app running on http://localhost:5000"
# Press Ctrl+C to stop
```

## Usage

The application consists of two main components that need to be running simultaneously:

### Quick Start (Windows)
Use the provided scripts for easy setup:

**PowerShell (Recommended):**
```powershell
.\start.ps1
```

**Command Prompt:**
```cmd
start.bat
```

Both scripts will:
- Check for required dependencies
- Install missing packages
- Offer startup options
- Guide you through the process

### Option 1: Run Everything Together (Recommended)
```bash
npm run dev:full
```
This command starts:
- React development server (frontend)
- Python Flask backend
- Electron desktop app

### Option 2: Manual Startup
If you prefer to start components separately:

**Terminal 1 - Start Python Backend:**
```bash
npm run start:backend
# OR manually:
# cd backend && python app.py
```

**Terminal 2 - Start React Frontend:**
```bash
npm run start:react
```

**Terminal 3 - Start Electron App:**
```bash
npm run start:electron
```

### Option 3: Production Build
```bash
npm run build
npm start
```

### Testing Backend Functionality
To test if the Wikipedia search backend is working:
```bash
python test_backend.py
```
Make sure the backend is running first (`npm run start:backend`).

## Available Scripts

- `npm run dev:full` - Start all components (React + Python + Electron)
- `npm run start:react` - Start React development server only
- `npm run start:backend` - Start Python Flask backend only
- `npm run start:electron` - Start Electron app only
- `npm run build` - Build React app for production
- `npm start` - Start production build
- `npm test` - Run tests

## Helper Scripts

- `start.ps1` - PowerShell script for guided application startup (Windows)
- `start.bat` - Batch script for guided application startup (Windows)
- `test_backend.py` - Test script to verify backend functionality

## Features Guide

### Wikipedia Search
The Wikipedia search feature requires the Python backend to be running. It provides:
- Real-time search suggestions
- Article previews with images
- Full article content display
- Proper scrolling for long articles

### Room Navigation
Navigate between different planning rooms:
- Click on room cards to enter different environments
- Each room has specialized tools and layouts
- Content is properly scrollable in all rooms

### Goal Planning
- Input your goals in the main interface
- Receive AI-generated questions to refine your planning
- Build comprehensive action plans

## Troubleshooting

### Python Backend Issues
**Problem**: Wikipedia search not working
**Solution**: Ensure Python backend is running:
```bash
cd backend
python app.py
```
You should see: "Flask app running on http://localhost:5000"

**Problem**: Python dependencies missing
**Solution**: Reinstall Python packages:
```bash
cd backend
pip install -r requirements.txt
```

### Node.js Issues
**Problem**: Module not found errors
**Solution**: Reinstall Node.js dependencies:
```bash
rm -rf node_modules package-lock.json
npm install
```

**Problem**: Port already in use
**Solution**: Kill processes using the ports:
```bash
# Kill process on port 3000 (React)
npx kill-port 3000
# Kill process on port 5000 (Python)
npx kill-port 5000
```

### Electron Issues
**Problem**: Electron window not opening
**Solution**: Ensure React dev server is running first:
```bash
npm run start:react
# Wait for "webpack compiled successfully"
# Then start Electron in another terminal:
npm run start:electron
```

## Development

### Code Structure
- **Frontend**: React with TypeScript in `src/`
- **Backend**: Flask Python API in `backend/`
- **Electron**: Main process in `main.js`

### Adding New Features
1. For UI changes: Modify React components in `src/components/`
2. For API changes: Update Flask routes in `backend/app.py`
3. For new rooms: Add components in `src/components/content/`

### Testing
```bash
npm test                # Run React tests
cd backend && python -m pytest  # Run Python tests (if available)
```

## Running Tests
To run the unit tests, use:
```
npm test
```

## Contributing
Feel free to submit issues or pull requests for improvements and bug fixes.

## License
This project is licensed under the MIT License.