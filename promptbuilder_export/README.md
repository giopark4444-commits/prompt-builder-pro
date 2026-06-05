# Prompt Builder Pro
## Para Claude Code — contexto completo del proyecto

### Enlaces
- **App en vivo:** https://giopark4444-commits.github.io/prompt-builder-pro/
- **Repo:** https://github.com/giopark4444-commits/prompt-builder-pro (público — nunca subir claves reales)

### Archivo principal
`prompt_builder_pro.html` — app standalone HTML/CSS/JS, ~535 KB, sin dependencias externas excepto Google Fonts y la API de Anthropic.

### Stack
- HTML + CSS variables (light/dark/auto)
- Vanilla JS (sin frameworks)
- Anthropic API: claude-sonnet-4-6 (análisis de archivos/imágenes) y claude-haiku-4-5-20251001 (refinar prompt y traducción)
- localStorage para persistencia (key `pbpv3`; usuarios/comunidad en keys `pbpv3_*`)

### Arquitectura
```
S{}            — State object central
CATS[]         — 10 categorías (image, app, brand_design, character, location,
                 storyboard, video, music, sound, voice) + combinator (herramienta)
SECS{}         — Secciones por categoría: key, label{ES/FR/EN}, single, ch[], impact(0-100)
T{} + t(k)     — Traducciones de interfaz: ES/FR/EN completas + ZH/HI/AR/BN/PT/RU/JA
                 parciales (lo no traducido cae a EN)
HELP_STR + ht(k) — Textos del centro de ayuda (ES/EN/FR; los otros 7 idiomas caen a EN).
                 HT_ALIAS delega en t() las claves que ya existen en T{} (fuente única)
COLS[]         — 10 colores de tag
TL_OPTS{}      — Opciones de timeline (shots, moves, lights, emotions, lenses, transitions)
escHtml()/safeUrl() — Helpers de seguridad: escapar HTML y validar URLs (solo http(s)/data:image)
```

### Features implementadas
- [x] 10 categorías de prompt (imagen, app/ui, diseño de marca, personaje, locación, storyboard, video, música, sonido, voz)
- [x] Brand Design: 14 secciones (entregable, industria, tipo de logo, composición, estilo, tipografía, paleta, personalidad, slogan, voz de marca, formas, inspiración, aplicaciones, formato) + toolbar IA propia (Ideogram, Recraft, Midjourney, FLUX…)
- [x] Sistema de impacto visual por sección (1–100) con color coding
- [x] Framework de dirección visual completo (Art Style, Render, Character Identity, Clothing, Skin Texture, FX, Linework, Era, Reference DNA, Typography, Quality Control)
- [x] 26 LUTs analógicos, 19 cámaras cinematográficas, 34 ángulos, 31 movimientos de cámara, apertura f/1.2–f/22, 17 focales, 10 grados de grano
- [x] Director Reference DNA (Villeneuve, Kubrick, Wong Kar-wai, Tarkovsky, etc.)
- [x] Timeline segundo a segundo con beats (shot, move, light, emotion, lens, transition, notas)
- [x] Favoritos, ordenamiento (Orig/A-Z/Z-A/★/Color), color por sección y por tag, drag & drop, tags custom
- [x] Combos (selección de opciones reutilizable) y Presets (configuración de la app)
- [x] Analizador de archivos (imagen/video/audio/texto → tags + sugerencias) vía API
- [x] Acciones IA: Refinar, 3 Variaciones, Optimizar EN; traducción del prompt
- [x] Biblioteca persistente con carpetas/subcarpetas, buscador, export/import JSON y packs
- [x] Referencias (banco de inspiración), Estadísticas de uso
- [x] Comunidad, Perfil y panel Admin — **solo locales** (localStorage; sin backend, no hay datos compartidos reales)
- [x] Centro de ayuda con inicio rápido, índice navegable y 5 diagramas SVG que siguen el tema claro/oscuro; traducido ES/EN/FR
- [x] Interfaz en 10 idiomas (ES/FR/EN completos; ZH/HI/AR/BN/PT/RU/JA parciales con fallback a EN)
- [x] Tema claro/oscuro/auto, panel de control (tipografía, tamaños, densidad, plataforma y ratio favoritos)

### Features pendientes / ideas
- [ ] Traducir el centro de ayuda a los otros 7 idiomas
- [ ] Backend real (p. ej. Supabase) para que Comunidad/Perfil/Admin sean compartidos
- [ ] Validación robusta de JSON/packs importados
- [ ] Pesos por tag (slider 0.1–2.0)
- [ ] Historial de versiones del prompt (diff visible)
- [ ] Modo "Director" — pre-carga la estética completa de un director
- [ ] Exportar en sintaxis nativa de cada plataforma (--ar, --chaos para MJ; cfg_scale para SD)
- [ ] Preview de imagen generada junto al prompt

### Orden de secciones por impacto (imagen)
1. Iluminación ★98 · 2. Character Identity ★96 · 3. Art Style ★95 · 4. Reference DNA ★94 · 5. Color Palette ★92 · 6. Mood ★91 · 7. Camera Language ★90 · 8. Render/Shading ★88 · 9. Composition ★87 · 10. Lens/Focal ★85 · 11. Environment ★84 · 12. Era ★83 · 13. Clothing ★82 · 14. Camera Angle ★80 · 15. Skin Texture ★78 · 16. FX ★76 · 17. Linework ★72 · 18. Quality Control ★68 · 19. Typography/UI ★55 · 20. Aspect Ratio ★40 · 21. Generador ★15

### Seguridad y notas para continuación
- El HTML es standalone: ábrelo en cualquier navegador, o sirve la carpeta con `serve.py` (puerto 7432).
- Deploy: push a `main` → GitHub Pages se actualiza solo en 1-2 minutos (`index.html` de la raíz redirige aquí).
- **Clave API:** el usuario pega su `sk-ant-…` en *Panel de control → Clave API Anthropic*; se guarda solo en su localStorage. Sin clave, las instrucciones se copian al portapapeles para usarlas en Claude. **Nunca** escribir una clave real en el código (repo público).
- Construcción de HTML dinámico: usar siempre `escHtml()` para texto/atributos y `safeUrl()` para URLs; en `onclick` con datos, el patrón es `onclick="fn(${escHtml(JSON.stringify(data))})"`.
- `seedSuperUser()` crea el superusuario si no existe y solo siembra la contraseña (`SUPER_SEED_PASS`) cuando falta — no sobreescribe una contraseña cambiada. Todo el "Admin" es client-side: no es seguridad real.
- `buildTV()` reconstruye el mapa de valores en cada interacción para manejar el orden dinámico.

### Historial
Ver `RESUMEN.md` (raíz del repo) para el seguimiento del proyecto. El desarrollo iterativo v1→v3 está en `conversation_history.txt` (archivo **local**, fuera del repo público).
