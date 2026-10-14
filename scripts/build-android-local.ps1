$ErrorActionPreference = "Stop"
Write-Host "Nieto Green Care - Android local build"
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { throw "Instala Node.js 22 LTS primero." }
if (-not (Get-Command java -ErrorAction SilentlyContinue)) { throw "Instala JDK 17 y define JAVA_HOME." }
if (-not $env:ANDROID_HOME) { throw "Configura ANDROID_HOME con la ruta del SDK de Android Studio." }
if (-not (Test-Path ".env.local")) { throw "Crea .env.local con EXPO_PUBLIC_SUPABASE_URL y EXPO_PUBLIC_SUPABASE_ANON_KEY." }
if (-not (Test-Path "node_modules")) { npm ci; if ($LASTEXITCODE -ne 0) { throw "npm ci falló" } }
npm run typecheck
if ($LASTEXITCODE -ne 0) { throw "Error de TypeScript" }
npx expo prebuild --platform android --clean --no-install
if ($LASTEXITCODE -ne 0) { throw "Expo prebuild falló" }
Push-Location android
try {
  .\gradlew.bat assembleRelease
  if ($LASTEXITCODE -ne 0) { throw "Gradle assembleRelease falló" }
} finally { Pop-Location }
Write-Host "APK generado en android\app\build\outputs\apk\release\app-release.apk"
Write-Host "AVISO: Para distribuir una APK de producción debes firmarla con tu keystore; assembleRelease puede generar un archivo sin firmar."
