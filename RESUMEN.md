# 📋 Resumen del proyecto — Prompt Builder Pro

Documento de seguimiento de todo lo trabajado. Última actualización: **4 de junio de 2026**.

---

## 🎯 Qué es

**Prompt Builder Pro Beta** — una app web para construir *prompts* (instrucciones) de IA generativa de forma rápida y ordenada: eliges opciones (estilo, iluminación, cámara, etc.) y la app las combina en un prompt listo para copiar y pegar en Midjourney, Sora, ChatGPT, Kling y más.

- **Un solo archivo HTML** standalone (`promptbuilder_export/prompt_builder_pro.html`), sin frameworks, JavaScript vanilla.
- Los datos se guardan en el navegador (localStorage).
- Las acciones de IA usan la API de Anthropic.
- Interfaz en 10 idiomas.

---

## 🌐 Enlaces

| Recurso | Enlace |
|---|---|
| **App en vivo (GitHub Pages)** | https://giopark4444-commits.github.io/prompt-builder-pro/ |
| **Repositorio (GitHub)** | https://github.com/giopark4444-commits/prompt-builder-pro |

---

## ✅ Lo que hemos hecho

### 1. Revisión inicial del proyecto
- Se localizó y revisó la carpeta `~/Desktop/promp app/promptbuilder_export/`.
- Se detectaron puntos a mejorar: API key en el frontend (solo uso personal), modelos de IA desactualizados en el README y configuración duplicada.

### 2. Centro de ayuda — reconstrucción completa
- Se **corrigieron 2 bugs** visibles (texto de código `t("…")` que se mostraba crudo al usuario).
- Se **completaron las secciones que faltaban**: Referencias, Estadísticas, Timeline de video, colores/favoritos/orden del Builder, categorías personalizadas, Combos vs Presets, API key.
- Se añadió un **inicio rápido en 3 pasos** y un **índice navegable**.
- Se crearon **5 diagramas SVG** (mapa de la app, flujo del Builder, biblioteca, referencias, comunidad) que se adaptan al tema claro/oscuro.

### 3. Centro de ayuda — traducción ES / EN / FR
- Se convirtió la ayuda estática en un motor `renderHelp()` con un diccionario `HELP_STRINGS` de **188 textos** en español, inglés y francés.
- **Cambia automáticamente** con el idioma de la app. Los diagramas también se traducen.
- *(Los otros 7 idiomas de la interfaz muestran la ayuda en inglés por ahora.)*

### 4. Nueva categoría: Diseño de Marca (Brand Design)
- Categoría nueva en el grupo **Creación de Contenido**, junto a App/UI.
- **14 secciones** con todas las opciones de prompt: entregable, rubro/industria, tipo de logo, composición, estilo, tipografía, paleta, personalidad, slogan/tagline, voz de marca, lenguaje de formas, inspiración, aplicaciones y formato.
- **Barra de herramientas IA** propia (Ideogram, Recraft, Midjourney, FLUX, etc.), como las demás categorías.

### 5. Publicación en GitHub + despliegue
- Repositorio **público** creado y subido.
- Desplegado en **GitHub Pages** con un `index.html` de entrada para tener un enlace limpio.
- A partir de ahora los cambios se suben automáticamente y Pages se actualiza solo en 1-2 minutos.

### 6. Auditoría de seguridad, bugs y coherencia
Se revisó toda la app. Hallazgos y arreglos aplicados:
- 🔴 **Bugs reparados:** los botones *"Usar prompt →"* (Comunidad), *"Cargar"* (Perfil) y el separador del Combinador estaban **rotos** — las comillas de `JSON.stringify` cerraban el atributo `onclick`. Solucionado con `escHtml`.
- 🟠 **XSS cerrado:** se escapan `mediaUrl`, `title`, `username` y los avatares en Comunidad/Perfil. Nuevo helper `safeUrl()` que solo permite `http(s)`/`data:image` y bloquea `javascript:`.
- 🟡 **Coherencia:** config duplicada unificada (`tagFz`), README con los modelos de IA correctos.
- 🔐 **Admin:** la contraseña por defecto del superusuario dejó de ser `1234` (se cambió a una no obvia).

**Nota importante sobre la "Comunidad" y el "Admin":** la app **no tiene servidor (backend)**. Usuarios, comunidad y panel Admin viven solo en el navegador de cada visitante (localStorage). No es seguridad real ni datos compartidos — es local. Para que fueran reales haría falta un backend (p. ej. Supabase).

### 7. Code review completo + correcciones (4 jun 2026)
Se hizo una revisión profunda (7 ángulos + verificación) de todo el trabajo. Arreglos aplicados:
- 🟠 **seedSuperUser:** ya no sobreescribe la contraseña del admin en cada carga — solo la siembra si falta (antes, cualquier cambio se revertía solo). La contraseña pasó a una constante única (`SUPER_SEED_PASS`).
- 🟡 **Escape HTML:** 3 sitios (Perfil reciente ×2 y panel Admin) usaban un escape incompleto (`<` solamente); ahora usan `escHtml()` — nombres con `&`, `>` o `"` se ven bien.
- 🟢 **Traducciones unificadas:** 12 textos de los diagramas de ayuda que duplicaban claves de la interfaz ahora se leen de `T{}` vía un alias (`HT_ALIAS`) — una sola fuente de verdad. Bonus: los diagramas ahora aprovechan las traducciones parciales de los otros 7 idiomas en vez de caer siempre a inglés.
- 📝 **README.md** reescrito: reflejaba la v3.0 (decía 9 categorías, 3 idiomas, ~122KB); ahora describe el estado real (10 categorías, 10 idiomas, ~535KB, Comunidad/Admin, centro de ayuda, helpers de seguridad).
- ✅ Verificado en navegador (carga sin errores, ayuda renderiza, contraseña personalizada se conserva) y sintaxis JS validada con Node.

Verificados como **seguros** (no eran bugs): el patrón `escHtml(JSON.stringify())` en onclick, los colores de los SVG al cambiar tema (usan variables CSS) y el fallback de idiomas de la ayuda.

---

## 🕓 Historial de commits

| Commit | Descripción |
|---|---|
| `76c2e77` | Añade categoría Diseño de Marca al Builder |
| `223ad06` | Completa Brand Design: barra de herramientas IA y 3 secciones nuevas |
| `077ce22` | Traduce el centro de ayuda a ES/EN/FR |
| `eab8746` | Añade index.html de entrada para GitHub Pages |
| `83e552d` | Añade RESUMEN.md con el resumen del proyecto |
| `ed74e5c` | Seguridad y bugs: repara botones rotos y cierra XSS |
| `be6d369` | Admin: contraseña por defecto no obvia + actualiza RESUMEN.md |
| `114c7d4` | Code review: fix seedSuperUser, escapes completos, traducciones unificadas, README al día |

---

## 💡 Posibles siguientes pasos

- Traducir el centro de ayuda a los otros 7 idiomas de la interfaz (hoy caen a inglés).
- Añadir un **backend** (p. ej. Supabase) si se quiere que usuarios/Comunidad/Admin sean reales y compartidos.
- Validación robusta de los archivos JSON/packs que se importan.
- Ideas del propio proyecto: pesos por tag (0.1–2.0), historial de versiones del prompt, modo "Director" con estética precargada, exportar en sintaxis nativa de cada plataforma (`--ar`, `--chaos`…).

---

> ⚠️ **Seguridad:** el repositorio es **público**. Nunca debe subirse una clave API real (`sk-ant-…`) dentro del código — la app guarda la clave solo en el navegador del usuario. Cualquier credencial escrita en el código (incluida la del Admin) es visible para todos; la privacidad real solo llega con un repo privado o un backend.
