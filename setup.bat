chcp 65001
@echo off

IF NOT EXIST venv (
    echo Creating venv...
    python.exe -m venv venv
)

:: Create the directory if it doesn't exist
:: mkdir ".\logs" > nul 2>&1

:: Deactivate the virtual environment to prevent error
call .\venv\Scripts\deactivate.bat

call .\venv\Scripts\activate.bat

REM first make sure we have setuptools available in the venv    
REM python.exe -m pip install --require-virtualenv --no-input -q -q  setuptools

REM Check if the batch was started via double-click
IF /i "%%comspec%% /c %%~0 " equ "%%cmdcmdline:"=%%" (
    REM echo This script was started by double clicking.
    cmd /k python.exe .\setup\setup_windows.py
) ELSE (
    REM echo This script was started from a command prompt.
    python.exe .\setup\setup_windows.py %*
)

:: Deactivate the virtual environment
call .\venv\Scripts\deactivate.bat