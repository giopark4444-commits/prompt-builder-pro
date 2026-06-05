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
- 📝 **README.md** reescrito: reflejaba la v3.0 (decía 9 categorías, 3 idiomas, ~122KB); ahora describe el estado real (38 categorías en 8 grupos, 10 idiomas, ~535KB, Comunidad/Admin, centro de ayuda, helpers de seguridad).
- ✅ Verificado en navegador (carga sin errores, ayuda renderiza, contraseña personalizada se conserva) y sintaxis JS validada con Node.

Verificados como **seguros** (no eran bugs): el patrón `escHtml(JSON.stringify())` en onclick, los colores de los SVG al cambiar tema (usan variables CSS) y el fallback de idiomas de la ayuda.

Además: `conversation_history.txt` (800KB de historial privado) y `.claude/` salieron del repo público (siguen en disco; persisten en commits antiguos), y se añadió un favicon inline (adiós al 404 de consola).

### 8. QA completo de la app + fixes de i18n/UX (4 jun 2026)
Se probó la app **página por página y botón por botón** con Playwright (navegador real, sin API key): las 38 categorías construyen prompt, navegación completa, Biblioteca (guardar/buscar/ordenar/carpetas/editar/renombrar/duplicar/mover/eliminar/añadir manual/export), Referencias, Estadísticas, Ayuda (5 diagramas + índice + cambio de idioma), Comunidad (registro, login, publicar, like, comentar, "Usar prompt →", filtros), Perfil (editar), Admin (login superusuario, panel), Panel de control (10 idiomas, temas claro/oscuro/auto, 6 sliders, selects, presets, gestor ⊞), acciones IA sin clave (copian instrucciones, no llaman a la API). **0 errores de consola en todo el recorrido.**

Bugs encontrados y corregidos (todos de i18n/UX, ninguno funcional):
- 🟡 **Textos hardcodeados en español** que ignoraban el idioma de la UI: menú del prompt en Biblioteca (Editar/Renombrar/Duplicar/Mover a carpeta/Cambiar categoría), cabecera del modal añadir/editar prompt, botones "Cancelar"/"Eliminar"/"Crear" de los diálogos, placeholders del modal de Comunidad → ahora todo usa `t()`.
- 🟡 **Modal "Edit Profile" hardcodeado en inglés** (título, labels y botones) → ahora usa `t()`.
- 🟠 **Diálogo de cerrar sesión confuso**: decía "Sign out?" (inglés fijo) con botón rojo **"Eliminar"** → ahora "¿Cerrar sesión?" / botón "Salir", traducido.
- 🟠 **Eliminar un prompt era instantáneo y sin deshacer** (carpetas y referencias sí confirmaban) → ahora pide confirmación.
- 🟢 **nav_r añadido a los 7 idiomas parciales** (ZH/HI/AR/BN/PT/RU/JA): "Referencias" ya no aparece en inglés en esos idiomas.

### 9. Refinamiento visual + nueva paleta esmeralda (5 jun 2026)
Sin tocar arquitectura ni funcionalidad (solo CSS, en bloques reversibles al final del estilo):
- **Pulido**: sombras cálidas en capas con lift al hover, respuesta táctil en tags/botones, foco con anillo del acento, modales con entrada suave, scrollbars del tema, modo oscuro con más profundidad. Respeta `prefers-reduced-motion`.
- **Amplificación**: fuga de luz sutil, titular con más presencia, iconos de categoría en chips del acento, subrayado corto en cabeceras de grupo, CTA de IA en el color del acento, barra lateral con gradiente y barra de acento en el item activo.
- **Paleta**: el ámbar pasó a **esmeralda** (#059669 claro / #34d399 oscuro) en ambos temas, elegida entre 3 candidatas previsualizadas en vivo (violeta, cobalto, esmeralda). Todos los ámbar hardcodeados migrados (sidebar activo, drag de carpetas, engine badge, botones de orden); las **estrellas ★ de favoritos siguen doradas** (semántico). Los presets de tema y los colores personalizados de tags no se tocaron.
- Una propuesta de rediseño completo ("Director's Cut", `propuesta-estetica/`) fue descartada por perder la esencia; quedó en el repo como referencia.

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
