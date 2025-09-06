@echo off
set LOGFILE=run-log.txt
echo ================================ > %LOGFILE%
echo 🚀 WhatsApp Bot Project Run Log >> %LOGFILE%
echo ================================ >> %LOGFILE%

echo ================================
echo 🚀 Starting WhatsApp Bot Project (Auto-Fix + Auto-Update + Log)
echo ================================

REM Check if package.json exists
if not exist package.json (
    echo ❌ package.json not found! Make sure you're in the right folder. >> %LOGFILE%
    echo ❌ package.json not found! Make sure you're in the right folder.
    pause
    exit /b
)

REM Delete node_modules and package-lock.json if needed
if exist node_modules (
    echo 🔹 Cleaning old node_modules... >> %LOGFILE%
    echo 🔹 Cleaning old node_modules...
    rmdir /s /q node_modules
)
if exist package-lock.json (
    echo 🔹 Removing old package-lock.json... >> %LOGFILE%
    echo 🔹 Removing old package-lock.json...
    del package-lock.json
)

REM Install dependencies
echo 🔹 Installing dependencies... >> %LOGFILE%
echo 🔹 Installing dependencies...
call npm install >> %LOGFILE% 2>&1 || (
    echo ❌ npm install failed! >> %LOGFILE%
    echo ❌ npm install failed!
    pause
    exit /b
)

REM Check, Install or Update missing/old packages
echo 🔹 Checking for missing or outdated modules... >> %LOGFILE%
echo 🔹 Checking for missing or outdated modules...
for %%p in (express venom-bot qrcode) do (
    call npm list %%p >nul 2>&1
    if errorlevel 1 (
        echo 📦 Installing missing module: %%p >> %LOGFILE%
        echo 📦 Installing missing module: %%p
        call npm install %%p@latest >> %LOGFILE% 2>&1
    ) else (
        echo 🔄 Updating module: %%p >> %LOGFILE%
        echo 🔄 Updating module: %%p
        call npm install %%p@latest >> %LOGFILE% 2>&1
    )
)

REM Start the bot
echo 🔹 Starting bot... >> %LOGFILE%
echo 🔹 Starting bot...
call npm start >> %LOGFILE% 2>&1

echo ================================ >> %LOGFILE%
echo ✅ Script finished running! >> %LOGFILE%
echo ================================ >> %LOGFILE%
pause
