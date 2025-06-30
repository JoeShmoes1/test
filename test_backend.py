#!/usr/bin/env python3
"""
Simple test script to verify the Wikipedia backend functionality
"""

import sys
import os
import requests
import json

# Add backend directory to path
backend_path = os.path.join(os.path.dirname(__file__), 'backend')
sys.path.insert(0, backend_path)

def test_backend_health():
    """Test if the backend is running and responding"""
    try:
        response = requests.get('http://localhost:5000/health', timeout=5)
        if response.status_code == 200:
            print("✅ Backend health check passed")
            return True
        else:
            print(f"❌ Backend health check failed: {response.status_code}")
            return False
    except requests.exceptions.RequestException as e:
        print(f"❌ Backend not reachable: {e}")
        return False

def test_wikipedia_search():
    """Test Wikipedia search functionality"""
    try:
        response = requests.get('http://localhost:5000/search?q=python programming', timeout=10)
        if response.status_code == 200:
            data = response.json()
            if 'suggestions' in data and len(data['suggestions']) > 0:
                print("✅ Wikipedia search test passed")
                print(f"   Found {len(data['suggestions'])} results")
                return True
            else:
                print("❌ Wikipedia search returned no results")
                return False
        else:
            print(f"❌ Wikipedia search failed: {response.status_code}")
            return False
    except requests.exceptions.RequestException as e:
        print(f"❌ Wikipedia search failed: {e}")
        return False

def test_wikipedia_summary():
    """Test Wikipedia summary functionality"""
    try:
        response = requests.get('http://localhost:5000/summary/Python (programming language)', timeout=10)
        if response.status_code == 200:
            data = response.json()
            if 'title' in data and 'extract' in data:
                print("✅ Wikipedia summary test passed")
                print(f"   Article: {data['title']}")
                return True
            else:
                print("❌ Wikipedia summary returned invalid data")
                return False
        else:
            print(f"❌ Wikipedia summary failed: {response.status_code}")
            return False
    except requests.exceptions.RequestException as e:
        print(f"❌ Wikipedia summary failed: {e}")
        return False

def main():
    """Run all backend tests"""
    print("🧪 Testing Goal Planner Backend...")
    print("=" * 50)
    
    # Test 1: Health check
    health_ok = test_backend_health()
    
    if not health_ok:
        print("\n❌ Backend is not running. Please start it with:")
        print("   cd backend && python app.py")
        return False
    
    # Test 2: Wikipedia search
    search_ok = test_wikipedia_search()
    
    # Test 3: Wikipedia summary
    summary_ok = test_wikipedia_summary()
    
    # Results
    print("\n" + "=" * 50)
    if health_ok and search_ok and summary_ok:
        print("🎉 All tests passed! The backend is working correctly.")
        return True
    else:
        print("⚠️  Some tests failed. Check the backend implementation.")
        return False

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
