#!/bin/bash

# Script to set up a Python project with a virtual environment and install requirements

# Define the name of the virtual environment directory
VENV_DIR="finpred_env"

# Check if the virtual environment directory exists
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment in '$VENV_DIR'..."
    python3.11 -m venv "$VENV_DIR"
    if [ $? -ne 0 ]; then
        echo "Error creating virtual environment. Please ensure Python is installed and in your PATH."
        exit 1
    fi
else
    echo "Virtual environment already exists in '$VENV_DIR'."
fi

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Check if requirements.txt exists
if [ -f "requirements.txt" ]; then
    echo "Installing requirements from 'requirements.txt'..."
    pip3.11 install -r "requirements.txt"
    if [ $? -ne 0 ]; then
        echo "Error installing requirements. Please check your 'requirements.txt' file."
        deactivate
        exit 1
    fi
else
    echo "No 'requirements.txt' file found. If your project has dependencies, please create this file."
fi

echo "Setup complete! Virtual environment activated and requirements installed (if any)."
echo "You can now run your project."

# Note: The virtual environment will remain active in your current terminal session.
# To deactivate it later, simply run: deactivate