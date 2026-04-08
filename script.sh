#!/bin/bash
# Railway deployment script for Roronoa Zoro Learning Platform
# This script determines which service to deploy based on the PORT variable

set -e

echo "🚀 Starting Railway deployment for Roronoa Zoro..."

# Check if we're in backend directory or if backend files exist
if [ -f "backend/main.py" ] && [ -f "backend/requirements.txt" ]; then
    echo "📦 Detected backend service - deploying FastAPI..."

    # Navigate to backend directory
    cd backend

    # Install Python dependencies
    echo "📦 Installing Python dependencies..."
    pip install -r requirements.txt

    # Start the FastAPI server
    echo "🚀 Starting FastAPI server on port $PORT..."
    exec uvicorn main:app --host 0.0.0.0 --port $PORT

# Check if we're in frontend directory or if frontend files exist
elif [ -f "frontend/package.json" ] && [ -f "frontend/vite.config.js" ]; then
    echo "⚛️ Detected frontend service - deploying React app..."

    # Navigate to frontend directory
    cd frontend

    # Install Node.js dependencies
    echo "📦 Installing Node.js dependencies..."
    npm install

    # Build the React app
    echo "🔨 Building React application..."
    npm run build

    # Start the preview server
    echo "🚀 Starting React preview server on port $PORT..."
    exec npm run preview -- --host 0.0.0.0 --port $PORT

else
    echo "❌ Error: Could not determine service type!"
    echo "📁 Current directory contents:"
    ls -la
    echo "📁 Backend check:"
    ls -la backend/ 2>/dev/null || echo "No backend directory"
    echo "📁 Frontend check:"
    ls -la frontend/ 2>/dev/null || echo "No frontend directory"
    exit 1
fi