# Research Room - Wikipedia Integration

The Research Room allows you to search and explore Wikipedia articles directly within the Goal Planner app.

## How It Works

The Research Room has two modes of operation:

### 1. With Backend Server (Recommended)
- **Enhanced performance**: Faster searches and better article summaries
- **Full thumbnail support**: Images from Wikipedia articles
- **Better error handling**: More detailed error messages

To use with backend:
1. Double-click `start-backend.bat` in the project root
2. Wait for "Starting Wikipedia Search Backend on port 5000" message
3. Use the Research Room normally

### 2. Fallback Mode (No Backend Required)
- **Direct Wikipedia API**: Uses CORS proxy for direct Wikipedia access
- **Basic functionality**: Search and article preview still work
- **No setup required**: Works immediately without any additional setup

## Features

- **Search Wikipedia**: Enter any search term to find relevant articles
- **Live Results**: See search results as you type
- **Article Preview**: Click on any result to see a detailed preview
- **Full Article Links**: Click "Read Full Article" to open the complete Wikipedia page
- **Responsive Design**: Works on all screen sizes

## Usage Tips

1. **Search Terms**: Use specific terms for better results (e.g., "Python programming" instead of just "Python")
2. **Multiple Results**: The search returns up to 8 results to choose from
3. **Article Navigation**: Each article includes a direct link to the full Wikipedia page
4. **Error Recovery**: If one search fails, try a different search term

## Technical Details

- **Primary**: Uses Python Flask backend on localhost:5000
- **Fallback**: Uses allorigins.win CORS proxy for direct Wikipedia API access
- **Wikipedia APIs Used**:
  - OpenSearch API for search results
  - REST API v1 for article summaries and metadata

## Troubleshooting

If you encounter issues:

1. **"Backend not available"**: This is normal - the app will automatically use fallback mode
2. **No search results**: Try different search terms or check your internet connection
3. **Slow responses**: This is normal for fallback mode; consider starting the backend server
4. **Images not loading**: Some images may not load in fallback mode due to CORS restrictions

The Research Room is designed to work reliably in all scenarios, so you can focus on your research without technical concerns.
