@echo off
SET CONDA_DIR=%USERPROFILE%\miniconda3
SET MINICONDA_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe
SET ENV_NAME=bert
SET PYTHON_VERSION=3.11

:: Step 1: Check if Conda is installed by running 'conda --version'
:: Ensure the Conda environment is activated first
IF NOT EXIST "%CONDA_DIR%\Scripts\activate.bat" (
    echo Conda is not installed. Installing Miniconda...
    
    :: Step 2: Conda is not installed, download and install Miniconda
    echo Downloading Miniconda...
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%MINICONDA_URL%', 'Miniconda3-latest-Windows-x86_64.exe')"

    :: Step 3: Run the Miniconda installer silently
    echo Installing Miniconda...
    Miniconda3-latest-Windows-x86_64.exe /quiet /norestart /InstallationType=JustMe /AddToPath=1

    :: Step 4: Clean up the installer
    del Miniconda3-latest-Windows-x86_64.exe

    echo Miniconda installation complete.
)
:: Step 2: Ensure Conda is initialized by calling its activation script
IF EXIST "%CONDA_DIR%\Scripts\activate.bat" (
    call "%CONDA_DIR%\Scripts\activate.bat"
) ELSE (
    echo Conda was not found in the expected location.
    exit /b 1
)
:: Step 3: Check if Conda works
for /f "tokens=*" %%i in ('conda --version 2^>nul') do set CONDA_VERSION=%%i
IF CONDA_VERSION EQU nul (
    echo Conda is not available. Exiting...
    exit /b 1
)

echo Conda is installed.
:: Step 4: Check if the environment exists and delete if necessary
echo Checking for existing environment "%ENV_NAME%"...

conda info --envs | findstr /C:"%ENV_NAME%" >nul
IF %ERRORLEVEL% EQU 0 (
    echo Environment "%ENV_NAME%" already exists.
) ELSE (
    :: Step 5: Create Conda environment if it doesn't exist or was deleted
    echo Creating Conda environment "%ENV_NAME%" with Python %PYTHON_VERSION%...
    conda create -y -n %ENV_NAME% python=%PYTHON_VERSION%
)
