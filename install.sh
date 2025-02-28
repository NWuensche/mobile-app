#!/bin/bash

# Exit on error
set -e

echo "=== Rebble Mobile App Installation Script ==="
echo "This script will set up the development environment for the Rebble app."

# Step 1: Initialize and update git submodules
echo "Step 1: Initializing and updating git submodules..."
git submodule update --init --recursive

# Step 3: Build and publish libpebblecommon to local Maven repository
echo "Step 2: Building and publishing libpebblecommon to local Maven repository..."
cd libpebblecommon
./gradlew publishToMavenLocal
cd ..

# Step 4: Install Flutter dependencies
echo "Step 3: Installing Flutter dependencies..."
if command -v fvm &> /dev/null; then
  echo "Using FVM to install Flutter dependencies..."
  fvm flutter pub get
else
  echo "FVM not found, using system Flutter..."
  flutter pub get
fi

echo "=== Installation completed successfully! ==="
echo "=== You can now run the app with 'fvm flutter run'! ==="
