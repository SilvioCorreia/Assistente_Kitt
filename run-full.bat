@echo off
cd /d "%~dp0"
if exist .venv\Scripts\python.exe (
    .venv\Scripts\python.exe agent.py console
) else (
    echo Virtual environment not found. Please run setup first.
    pause
)
