#!/bin/bash

# LiteLLM Docker Initialization Script
# Creates necessary directories for docker-compose.yml volumes

set -e  # Exit on any error

echo "🚀 Initializing LiteLLM Docker directories..."

# Create postgres_data directory
if [ ! -d "postgres_data" ]; then
    echo "📁 Creating postgres_data directory..."
    mkdir postgres_data
    echo "✅ postgres_data directory created"
else
    echo "ℹ️  postgres_data directory already exists"
fi

# Create prometheus_data directory
if [ ! -d "prometheus_data" ]; then
    echo "📁 Creating prometheus_data directory..."
    mkdir prometheus_data
    echo "✅ prometheus_data directory created"
else
    echo "ℹ️  prometheus_data directory already exists"
fi

# Set permissions (chmod 777)
echo "🔐 Setting directory permissions..."
chmod -R 777 postgres_data prometheus_data
echo "✅ Permissions set to 777 for both directories"


# Display directory information
echo ""
echo "📋 Directory Summary:"
echo "📂 postgres_data: $(ls -ld postgres_data | awk '{print $1, $3, $4, $9}')"
echo "📂 prometheus_data: $(ls -ld prometheus_data | awk '{print $1, $3, $4, $9}')"

echo ""
echo "🎉 Initialization complete! You can now run: docker-compose up -d"
echo ""
echo "💡 Tip: Make sure your .env file is properly configured before starting the services."