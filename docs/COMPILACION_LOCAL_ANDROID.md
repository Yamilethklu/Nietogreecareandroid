# Compilar Android localmente en Windows

Esta app es una copia de la versión iOS reciente, con acceso al mismo proyecto de Supabase. No se requiere Expo EAS para compilar en tu computadora.

## Requisitos
- Windows 10/11, Node.js 22, Git, JDK 17, Android Studio y Android SDK.
- Activa Android SDK Platform, Build Tools y Android SDK Command-line Tools en Android Studio.
- Define `JAVA_HOME` al JDK y `ANDROID_HOME` al SDK (usualmente `%LOCALAPPDATA%\Android\Sdk`). En Path agrega `%ANDROID_HOME%\platform-tools`.

## Comandos
```powershell
git clone https://github.com/Yamilethklu/Nietogreecareandroid.git
cd Nietogreecareandroid
npm ci
Copy-Item .env.example .env.local
notepad .env.local
```

Escribe los valores reales de **EXPO_PUBLIC_SUPABASE_URL** y **EXPO_PUBLIC_SUPABASE_ANON_KEY** del mismo Supabase que usa Apple. Nunca copies una service role key. Este archivo queda ignorado por Git.

Para ejecutar en emulador o teléfono Android con depuración USB:
```powershell
npx expo run:android
```

Para generar un APK de release en Windows:
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\build-android-local.ps1
```

Ruta de salida: `android\app\build\outputs\apk\release\app-release.apk`.

**Firma**: Una versión de release necesita firma propia para instalarse y distribuirse. Configura un keystore Android privado mediante Gradle (jamás lo publiques en GitHub). Para un APK de pruebas instalable, puedes generar un debug build con `cd android; .\gradlew.bat assembleDebug`, que queda en `android\app\build\outputs\apk\debug\app-debug.apk`.

**Problemas habituales**: Por la limitación de nombres de ruta en Windows (260 caracteres), instala el proyecto en una carpeta corta como `C:\ngc\` y activa rutas largas en Windows/Git. Se recomienda usar Android Studio con JDK 17. No se crea automáticamente una APK desde esta conversación: la compilación se ejecuta en la computadora de desarrollo.
