# Prompt Builder Pro v3.0
## Para Claude Code — contexto completo del proyecto

### Archivo principal
`prompt_builder_pro.html` — app standalone HTML/CSS/JS, ~122KB, sin dependencias externas excepto Google Fonts y Anthropic API.

### Stack
- HTML + CSS variables (light/dark auto)
- Vanilla JS (sin frameworks)
- Anthropic API: claude-sonnet-4-6 (análisis de archivos/imágenes) y claude-haiku-4-5-20251001 (refinar prompt y traducción)
- localStorage para persistencia

### Arquitectura
```
S{}                    — State object central
CATS[]                 — 9 categorías (image, app, character, location, storyboard, video, music, sound, voice)
SECS{}                 — Secciones por categoría, cada una con: key, label{ES/FR/EN}, single, ch[], impact(0-100)
T{}                    — Traducciones completas ES/FR/EN (interfaz + prompts)
COLS[]                 — 10 colores de tag
TL_OPTS{}              — Opciones de timeline (shots, moves, lights, emotions, lenses, transitions)
```

### Features implementadas
- [x] 9 categorías de prompt (imagen, video, música, sonido, voz, personaje, locación, storyboard, app/ui)
- [x] Sistema de impacto visual por sección (1–100) con color coding
- [x] Framework de dirección visual completo (Art Style, Render, Character Identity, Clothing, Skin Texture, FX, Linework, Era, Reference DNA, Typography, Quality Control)
- [x] 26 LUTs analógicos de film clásico (Kodak, Fuji, Agfa, Cinestill, Ilford)
- [x] 19 cámaras cinematográficas (ARRI, RED, Sony, Blackmagic, analógicas)
- [x] 34 ángulos de cámara (Camera Angle completo)
- [x] 31 movimientos de cámara
- [x] Apertura de diafragma f/1.2–f/22
- [x] 17 focales con descripción
- [x] 10 grados de grano de film (ISO)
- [x] Director Reference DNA (Villeneuve, Kubrick, Wong Kar-wai, Tarkovsky, etc.)
- [x] Descripción visual + narrativa para video (bloques dedicados)
- [x] Timeline segundo a segundo con beats (shot, move, light, emotion, lens, transition, notes)
- [x] Sistema de favoritos por sección (★ barra dorada)
- [x] Ordenamiento: Orig / A-Z / Z-A / ★ Favs / Color
- [x] Color por sección (10 colores, tiñe tags seleccionados)
- [x] Color individual por tag (menú flotante ⬤)
- [x] Drag & drop para reordenar tags
- [x] Tags custom por sección
- [x] Analizador de archivos (imagen/video/audio/texto → detecta tags + sugerencias)
- [x] Traducción de prompt ES/FR/EN vía API
- [x] Biblioteca persistente (localStorage, hasta 80 prompts)
- [x] Export/Import JSON de biblioteca
- [x] Panel de control: idioma UI, tipografía, tamaño de tags (3 sliders), densidad, tema, plataforma favorita, ratio favorito
- [x] Tema claro/oscuro/auto (auto según hora del día)
- [x] Multiidioma completo de interfaz (ES/FR/EN)
- [x] Acciones IA: Refinar, 3 Variaciones, Optimizar EN

### Features pendientes / ideas para Claude Code
- [ ] Preview de imagen generada al lado del prompt (integración directa con FLUX/MJ API)
- [ ] Sistema de pesos/weights por tag (slider 0.1–2.0)
- [ ] Historial de versiones del prompt (diff visible)
- [ ] Modo "Fórmula cinematográfica" — combina automáticamente las top categorías en orden óptimo
- [ ] Galería de prompts compartidos (communidad)
- [ ] Exportar prompt en sintaxis nativa de cada plataforma (--ar, --chaos para MJ; cfg_scale para SD)
- [ ] Colaboración en tiempo real (shared prompts)
- [ ] Modo "Director" — selecciona director y pre-carga su estética completa
- [ ] Tags con preview tooltip de imagen ejemplo

### Orden de secciones por impacto (imagen)
1. Iluminación ★98 — más poderosa
2. Character Identity ★96
3. Reference DNA ★94
4. Color Palette ★92
5. Mood / Emoción ★91
6. Camera Language ★90
7. Art Style ★95
8. Render/Shading ★88
9. Composition ★87
10. Lens/Focal ★85
11. Environment ★84
12. Era Reference ★83
13. Clothing System ★82
14. Camera Angle ★80 (video)
15. Skin Texture ★78
16. FX System ★76
17. Linework ★72
18. Quality Control ★68
19. Typography/UI ★55
20. Aspect Ratio ★40
21. Generador ★15

### Notas para continuación en Claude Code
- El archivo HTML es standalone, ábrelo en cualquier browser
- Para deploy: arrastrarlo a netlify.com/drop
- La API key de Anthropic no se pasa en el frontend (el fetch a /v1/messages está en el HTML, necesita proxy o configuración CORS para producción real)
- Los datos persisten en localStorage con key "pbpv3"
- El sistema de colores usa CSS variables y clases .tc-{color} en cada sección
- La lógica de buildTV() reconstruye el mapa de valores en cada interacción para manejar orden dinámico

### Conversación de contexto
Ver `conversation_history.txt` — historial completo del desarrollo iterativo desde v1 hasta v3.
