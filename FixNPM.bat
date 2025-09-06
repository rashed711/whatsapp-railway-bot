@echo off
echo 🚀 Starting NPM Fix Script...

REM اغلاق أي عمليات node أو npm
echo 🛑 Closing Node and npm processes...
taskkill /F /IM node.exe >nul 2>&1
taskkill /F /IM npm.exe >nul 2>&1

REM حذف node_modules
echo 🗑️ Removing node_modules...
IF EXIST node_modules (
    rmdir /s /q node_modules
)

REM حذف package-lock.json
echo 🗑️ Removing package-lock.json...
IF EXIST package-lock.json (
    del /f /q package-lock.json
)

REM تنظيف npm cache
echo 🧹 Cleaning npm cache...
npm cache clean --force

REM تثبيت الباكجات
echo 📦 Installing packages...
npm install --no-optional

echo ✅ Done! Try running your project now.
pause
