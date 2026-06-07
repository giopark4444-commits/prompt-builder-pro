# 📋 Resumen del proyecto — Prompt Builder Pro

Documento de seguimiento de todo lo trabajado. Última actualización: **7 de junio de 2026**.

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
- **Paleta**: el ámbar pasó a **esmeralda**, elegida entre 3 candidatas previsualizadas en vivo (violeta, cobalto, esmeralda), y luego se intensificó a pedido (**#00a56d claro / #2ee6a0 oscuro**, tintes más saturados, fuga de luz al 10%, tinta oscura sobre el verde vivo para contraste WCAG). Todos los ámbar hardcodeados migrados a `color-mix(var(--acc))` (sidebar activo, drag de carpetas, engine badge, botones de orden) — cambiar de paleta a futuro es tocar 6 variables. Las **estrellas ★ de favoritos siguen doradas** (semántico). Los presets de tema y los colores personalizados de tags no se tocaron.
- Una propuesta de rediseño completo ("Director's Cut", `propuesta-estetica/`) fue descartada por perder la esencia; quedó en el repo como referencia.

### 10. Dirección visual definida: grafito monocromo (7 jun 2026)
Tras revisar la paleta esmeralda (no convencía), se eligió una dirección **grafito / monocromo sobrio** y se aplicó directamente (solo las variables de acento + los textos que iban sobre el acento sólido):
- **Paleta** (sigue centralizada en 6 variables): acento grafito cálido que armoniza con la base piedra y no compite con el morado (sugerencias) ni el dorado (favoritos).
  - Claro: `--acc #3f3a34` · `--acc-bg #e9e5df` · `--acc-tx #3a352f`
  - Oscuro: `--acc #6e675e` · `--acc-bg #262219` · `--acc-tx #ddd6cc`
- **Inversión de contraste:** como el acento pasó de verde brillante a grafito oscuro, los textos que se dibujan *sobre* el acento sólido (estaban hardcodeados en tinta oscura para el verde) se invirtieron a blanco: avatar de usuario, icono de categoría (hover/activo), CTA principal de IA (`.abtn.em`), y los 2 botones que usaban `--acc-tx` sobre `--acc` (diálogo de carpeta "ok", pill de pack activo). Contraste WCAG verificado (blanco sobre acento ≈10:1 claro / ≈4.9:1 oscuro).
- Comentarios internos del CSS actualizados (ya no dicen "ámbar"). Las estrellas ★ de favoritos siguen doradas (semántico); los presets de tema y los colores de tags no se tocaron.

> 🎨 **Estado de la dirección visual:** APLICADA (grafito monocromo). Volver al esmeralda es revertir los commits de paleta; los bloques "REFINAMIENTO" y "AMPLIFICACIÓN" al final del CSS son independientes de la paleta y siguen vigentes.

### 12. Adaptación a dispositivos (7 jun 2026)
La app ya tenía buena base responsive (media queries para tablet 601–1024px y móvil ≤600px, barra superior y nav inferior móviles). Se auditó con Playwright en una matriz real (320, 390, 768, 1024, 1440 px × 7 vistas) y se corrigieron dos problemas concretos:
- 🟠 **Barra de acciones del prompt recortada en tablet:** entre 601–1024px, la `.pf-bar` (idioma + IA + Copiar/Guardar/Reset) usaba `nowrap` + scroll horizontal y **recortaba "★ Guardar" y "Reset"**. Ahora **envuelve** a varias líneas (`flex-wrap:wrap` + `row-gap`); también ayuda en ventanas de escritorio estrechas.
- 🔴 **Vistas inaccesibles en móvil:** Comunidad, Estadísticas y Ayuda solo vivían en el sidebar (oculto en móvil) y el avatar saltaba directo a Perfil → **no había forma de llegar a ellas en teléfono**. Se añadió un **menú desplegable desde el avatar** (`toggleMobMenu`) con Perfil, Comunidad, Estadísticas, Ayuda (+Admin si superusuario) y Cerrar sesión. Para invitados aparece un disparador ☰ con Estadísticas/Ayuda.
- ✅ Verificado: 0 overflow horizontal en toda la matriz, los diagramas SVG de la ayuda escalan, y el menú móvil navega correctamente (probado con registro real). 0 errores de consola propios.

### 13. Fixes i18n (7 jun 2026)
Dos bugs detectados durante el QA de dispositivos, corregidos y verificados (EN/ES):
- 🟡 **`cp_lang_h` mostraba la clave cruda** bajo el selector de idioma del panel: la clave no existía en ningún idioma y `t()` devuelve la clave cuando falta (string truthy), así que el `||fallback` nunca entraba. Añadida la clave a ES/FR/EN (los 7 idiomas parciales caen a EN, como el resto).
- 🟡 **Encabezado de Comunidad hardcodeado en español** (h1 + subtítulo): no seguían el idioma de la UI. Se le dio `id` al h1, se añadió la clave `comm_sub` y ambos se registraron en `applyUILang` (`community` / `comm_sub`) como los demás encabezados de vista.

### 11. Ayuda en 10 idiomas + imports robustos + sidebar monocromo (7 jun 2026)
Tres frentes cerrados en una tanda (verificados con Playwright sobre el navegador real):
- 🌍 **Centro de ayuda en los 10 idiomas:** los 176 textos de la ayuda se tradujeron a los 7 idiomas que antes caían a inglés (ZH, HI, AR, BN, PT, RU, JA). Se añadió un diccionario `HELP_X` (idioma → clave → texto) que `ht()` consulta antes del fallback a EN; las traducciones ES/EN/FR originales quedan intactas. **Árabe con RTL** *scoped* al contenedor de la ayuda (`dir=rtl` solo ahí; el resto de la app no se voltea). Verificado: la ayuda renderiza traducida en ZH/AR/RU y el árabe sale en RTL.
- 🛡 **Imports robustos** (`importLib` / `importPack`): límite de tamaño (8 MB), validación de forma y `sanitizeLibItem` que reconstruye cada prompt solo con campos conocidos y coerción de tipos (evita crashes por tipos raros y prototype pollution); `packName` capeado. Sin cambios de UX para archivos válidos.
- 🎨 **Sidebar al grafito:** el estado activo del menú y de las carpetas tenía un **verde esmeralda hardcodeado** (`rgba(0,229,151)`/`#36f0a8`) que la migración previa no tocó — por eso seguía verde tras cambiar la paleta. Ahora usa un realce **blanco neutro** (sobrio y legible sobre el sidebar siempre-oscuro, independiente del tema). El sidebar quedó 100 % monocromo.
- 🧪 QA visual: 0 errores de consola propios (solo un `ERR_CERT` del CDN de fuentes, bloqueado por la red del sandbox; la app cae a fuentes del sistema).

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
| `b23dd9f` | Privacidad: saca conversation_history.txt y .claude/ del repo público + favicon |
| `e419aa7` | QA completo + fixes i18n/UX tras probar la app botón por botón |
| `e47c9b7` | Propuesta estética "Director's Cut" (descartada, queda como referencia) |
| `7938763` | Refinamiento estético conservador: misma UI, más pulida |
| `d819985` | Amplificación de identidad visual: solo CSS, arquitectura intacta |
| `a96f4db` | Paleta esmeralda: mismo diseño, nuevo color en ambos temas |
| `600cb1f` | Esmeralda más intenso: acento vivo en ambos temas |
| `f7b1094` | Paleta grafito monocromo: dirección visual sobria en ambos temas |
| `fe79176` | Imports robustos + infraestructura i18n de la ayuda |
| *(este commit)* | Ayuda en 10 idiomas (HELP_X) + sidebar monocromo + QA |

---

## 💡 Posibles siguientes pasos

- ~~Traducir el centro de ayuda a los otros 7 idiomas~~ ✅ Hecho (ZH/HI/AR/BN/PT/RU/JA, con RTL en árabe). Pendiente opcional: revisión por hablantes nativos.
- Añadir un **backend** (p. ej. Supabase) si se quiere que usuarios/Comunidad/Admin sean reales y compartidos.
- Validación robusta de los archivos JSON/packs que se importan.
- Ideas del propio proyecto: pesos por tag (0.1–2.0), historial de versiones del prompt, modo "Director" con estética precargada, exportar en sintaxis nativa de cada plataforma (`--ar`, `--chaos`…).

---

> ⚠️ **Seguridad:** el repositorio es **público**. Nunca debe subirse una clave API real (`sk-ant-…`) dentro del código — la app guarda la clave solo en el navegador del usuario. Cualquier credencial escrita en el código (incluida la del Admin) es visible para todos; la privacidad real solo llega con un repo privado o un backend.
