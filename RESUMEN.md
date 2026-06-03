# 📋 Resumen del proyecto — Prompt Builder Pro

Documento de seguimiento de todo lo trabajado. Última actualización: **2 de junio de 2026**.

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

---

## 🕓 Historial de commits

| Commit | Descripción |
|---|---|
| `76c2e77` | Añade categoría Diseño de Marca al Builder |
| `223ad06` | Completa Brand Design: barra de herramientas IA y 3 secciones nuevas |
| `077ce22` | Traduce el centro de ayuda a ES/EN/FR |
| `eab8746` | Añade index.html de entrada para GitHub Pages |

---

## 💡 Posibles siguientes pasos

- Traducir el centro de ayuda a los otros 7 idiomas de la interfaz (hoy caen a inglés).
- Ideas del propio proyecto: pesos por tag (0.1–2.0), historial de versiones del prompt, modo "Director" con estética precargada, exportar en sintaxis nativa de cada plataforma (`--ar`, `--chaos`…).
- Ajustar el README para reflejar los modelos de IA actuales.

---

> ⚠️ **Seguridad:** el repositorio es público. Nunca debe subirse una clave API real (`sk-ant-…`) dentro del código. La app guarda la clave solo en el navegador del usuario, así que mientras no se escriba en el archivo, todo está bien.
