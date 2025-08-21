@echo off
REM Calls the PowerShell Todoist script with all arguments

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0task.ps1" %*
