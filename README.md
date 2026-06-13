# Prompt Builder Pro 🎛️

Una app web para **construir prompts de IA generativa** de forma rápida y ordenada:
eliges opciones (estilo, iluminación, cámara, tipografía, voz de marca…) y la app
las combina en un prompt listo para **copiar y pegar** en Midjourney, Sora, ChatGPT,
Kling, FLUX, Ideogram y más.

🌐 **App en vivo:** https://giopark4444-commits.github.io/prompt-builder-pro/

## ¿Qué hace?

- **38 categorías en 8 grupos** — Creación de Contenido (imagen, app/UI, diseño de
  marca, personaje, locación, storyboard, video, música, sonido, voz + combinador),
  Finanzas & Negocio, Marketing & Copywriting, Desarrollo de Equipo, Networking & Social,
  Código & Desarrollo, Investigación & Análisis y Soporte.
- **Dirección visual completa** — 26 LUTs analógicos, 19 cámaras cinematográficas,
  34 ángulos, 31 movimientos de cámara, aperturas f/1.2–f/22, 17 focales y más.
- **Sistema de impacto visual** por sección (1–100) con código de color.
- **Acciones de IA** (opcionales): analizar archivos/imágenes, refinar el prompt y
  traducir, usando la API de Anthropic.
- **Interfaz en 10 idiomas** y centro de ayuda con diagramas que se adaptan al tema
  claro/oscuro.
- **Comunidad** para compartir prompts (respaldada por Supabase).
- Todo se guarda en tu navegador (**localStorage**); es un único archivo HTML sin frameworks.

## ¿Para quién es?

Para creadores, diseñadores, marketers y cualquiera que use herramientas de IA
generativa y quiera prompts consistentes y bien estructurados sin partir de cero
cada vez.

## Cómo se usa

La forma más simple es abrir la **app en vivo** (enlace de arriba) — no requiere
instalación.

Para correrla en local:

```bash
git clone https://github.com/giopark4444-commits/prompt-builder-pro.git
cd prompt-builder-pro
python3 -m http.server 8000
# abre http://localhost:8000/  (redirige a la app)
```

> La app es 100 % estática (HTML/CSS/JS vanilla). El archivo principal es
> [`promptbuilder_export/prompt_builder_pro.html`](promptbuilder_export/prompt_builder_pro.html);
> también puedes abrirlo directamente con doble clic.

### Ejemplo de uso

1. Elige una categoría, p. ej. **Imagen**.
2. Marca las opciones que quieras: *estilo* → cinematográfico, *iluminación* → hora dorada,
   *cámara* → 35 mm f/1.4, *grano* → Kodak Portra…
3. La app arma el prompt combinado en tiempo real.
4. Pulsa **Copiar** y pégalo en Midjourney / Sora / la herramienta que uses.
5. (Opcional) usa **Refinar con IA** para pulir el texto o traducirlo.

### Funciones de IA (opcional)

Las acciones de IA usan la API de Anthropic (`claude-sonnet-4-6` para analizar
archivos/imágenes y `claude-haiku-4-5` para refinar y traducir). Introduce tu propia
API key desde la app; se guarda solo en tu navegador.

> ⚠️ El repositorio es público: **nunca subas claves reales** al código.

## Stack

HTML + CSS variables (claro/oscuro/auto) · JavaScript vanilla · API de Anthropic ·
localStorage · Supabase (comunidad) · GitHub Pages (hosting).
