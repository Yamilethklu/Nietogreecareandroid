# Nieto Green Care Android

Aplicación Android independiente, copiada de la versión reciente de [NietoGreenCareApp para Apple](https://github.com/Yamilethklu/NietoGreenCareApp) (commit `f1d09a0f725d5a82c3bdf4acd593290d86aa197c`, 13 de octubre de 2026). La app Apple y el sitio web no fueron modificados.

## Funciones copiadas
- Inicio de sesión con Google y correo; roles administrador y trabajador.
- Agenda por día, calendario, casas, clientes, órdenes y solicitudes.
- Facturas, cobros, pagos, precios, trabajadores, galería, opiniones y reportes semanales.
- Realtime y notificaciones conectadas al mismo proyecto Supabase del sitio web y Apple.

## Para generar el APK
1. En el proyecto Expo del repositorio Android, ejecutar `eas init` con tu cuenta y guardar el nuevo `extra.eas.projectId` en `app.json`. No copiar el identificador Expo de iOS.
2. En **GitHub > Settings > Secrets and variables > Actions**, configurar `EXPO_TOKEN`, `EXPO_PUBLIC_SUPABASE_URL` y `EXPO_PUBLIC_SUPABASE_ANON_KEY` (o la clave publishable equivalente), usando el **mismo proyecto** que el sitio y Apple. Nunca guardar `service_role` en la aplicación.
3. Confirmar que `nietogreencare://admin` está permitido en Supabase Auth > URL Configuration > Redirect URLs, sin retirar las URLs existentes.
4. Abrir **Actions > Android APK / AAB > Run workflow > preview** para generar APK instalable. `production` prepara AAB para Google Play.

El workflow comprueba `npm ci` y `npm run typecheck` antes de solicitar la compilación con EAS.

## Consideraciones
El APK de referencia aportado confirma el tipo de aplicación de trabajo, pero el código no se extrae del APK: se toma de la fuente iOS actualizada. No se modifica la base Supabase existente ni se duplican sus datos.

## Enlaces de instalación y actualizaciones

**Entrada estable Android:** este README. El APK descargable debe provenir de una compilación completada y verificada; no confundir el enlace del repositorio con un APK.

- [Compilaciones y ejecuciones de GitHub Actions](https://github.com/Yamilethklu/Nietogreecareandroid/actions).
- [Releases / APK publicados](https://github.com/Yamilethklu/Nietogreecareandroid/releases) (solo usar si existe un APK real).
- [Instalación privada Apple e información OTA](https://github.com/Yamilethklu/NietoGreenCareApp#instalación-privada-del-propietario-iphone).

**Estado de la nube:** el proyecto Android requiere configurar su propio `extra.eas.projectId` y validar las credenciales de EAS antes de construir APK. No afirmar que Android recibe OTA automáticamente sin confirmar `expo-updates`, `runtimeVersion`, canal y un workflow de publicación para Android. Las actualizaciones iOS del otro repositorio no actualizan este APK.

**Privacidad:** no subir credenciales, perfiles, tokens ni datos de clientes al repositorio. Compartir solo artefactos de instalación verificados.
