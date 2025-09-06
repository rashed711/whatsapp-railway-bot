# Fix-NPM.ps1
Write-Host "🚀 Starting NPM Fix Script..." -ForegroundColor Cyan

# اغلق اي process ممكن يكون ماسك الملفات
Write-Host "🛑 Closing Node and npm processes..."
Stop-Process -Name node -Force -ErrorAction SilentlyContinue
Stop-Process -Name npm -Force -ErrorAction SilentlyContinue

# مسح مجلد node_modules
Write-Host "🗑️ Removing node_modules..."
if (Test-Path "node_modules") {
    Remove-Item -Recurse -Force "node_modules"
}

# مسح package-lock.json
Write-Host "🗑️ Removing package-lock.json..."
if (Test-Path "package-lock.json") {
    Remove-Item -Force "package-lock.json"
}

# تنظيف cache
Write-Host "🧹 Cleaning npm cache..."
npm cache clean --force

# تثبيت الباكجات
Write-Host "📦 Installing packages..."
npm install --no-optional

Write-Host "✅ Done! Try running your project now." -ForegroundColor Green
