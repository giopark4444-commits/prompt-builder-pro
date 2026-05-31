# Flux — Concept v3 (Taskade-inspired, futurista, sin IA)

> Tercera iteración. Pivoteo desde "Mesa" a **Flux**: estética futurista oscura, gradientes iridiscentes, profundidad 2D-simulando-3D, y la **variedad de tipos de proyecto** que hace fuerte a Taskade (lista, tablero, mapa mental, cronograma, calendario, flujograma).

---

## Idea en una frase

**Flux es un workspace de productividad donde tus proyectos eligen su forma**: lista, tablero, mapa mental, cronograma, calendario o flujograma — la misma información, vista desde el ángulo que necesites.

---

## Por qué el cambio (Mesa → Flux)

| Mesa v2 | Flux v3 |
|---|---|
| Light cálido tipo "libreta" | Dark futurista con gradientes iridiscentes |
| 4 vistas por proyecto | 6 tipos de workspace nativos (Taskade-style) |
| Foco en una sola estética | Multi-color sistemático (cada proyecto tiene "su luz") |
| Plano | Profundidad 2D simulando 3D con sombras multinivel y glass |
| Genérico | Identidad visual fuerte y memorable |

---

## Sistema visual

### Paleta iridiscente

Cada color tiene **gradient + glow** asociado, lo que permite que cada workspace tenga personalidad cromática propia sin sentirse caótico.

| Token | Gradient | Uso típico |
|---|---|---|
| Violeta `#9B80FF` | `→ #5E4BC8` | Default, marca, listas |
| Cyan `#4FE3DD` | `→ #2A9D9A` | Mapas mentales, info |
| Pink `#FF6BD9` | `→ #C84BA8` | Tableros, urgente |
| Lime `#C8FF6B` | `→ #8FCB3F` | Cronogramas, éxito |
| Amber `#FFB84F` | `→ #C8842E` | Calendarios, pausa |
| Coral `#FF8062` | `→ #C85540` | Flujogramas, atención |

Gradient hero (para títulos): `linear-gradient(135deg, #9B80FF, #FF6BD9, #FFB84F)`.

### Fondo

- **Base**: `#07050E` (casi negro azulado profundo)
- **Mesh iridiscente animado**: 3 blobs de color (violeta, pink, cyan) con `filter: blur(120px)` y animación de 18-22s desplazándose suavemente
- **Grid overlay sutil**: líneas de `rgba(255,255,255,0.02)` cada 60px — da estructura sin distraer

### Tipografía

- **Display / headings**: `Space Grotesk` (geométrica, futurista pero legible)
- **UI**: `Inter` (densidad y claridad)
- **Mono / metadatos**: `JetBrains Mono`

### Efecto 3D sin 3D real

Logro la profundidad usando solo CSS:

1. **Sombras multinivel** (5 capas por card):
   - `inset` borde superior brillante (luz desde arriba)
   - `inset` borde inferior oscuro (sombra propia)
   - `outer` 1px sutil (separación)
   - `outer` 12-32px difusa (sombra ambiental)
   - `outer` 4-12px cercana (sombra de contacto)

2. **Glass morphism**: `backdrop-filter: blur(40px) saturate(180%)` en sidebar y modales sobre el mesh animado.

3. **Glow icons**: cada icono cuadrado tiene gradient + `box-shadow` con su color asociado + reflejo interno simulado con `::after` linear-gradient.

4. **Glow orb en cards de workspace**: una "luz" del color del proyecto, blureada, en la esquina superior derecha. Se intensifica en hover.

5. **Parallax 3D en hover**: las cards rotan ligeramente (`rotateX`, `rotateY`) siguiendo el cursor, dando sensación de objeto físico.

6. **Lift en hover**: `translateY(-3 a -4px)` + shadow más intensa = sensación de elevación.

7. **Gradient borders**: el top de cada card tiene una línea de 1px con `linear-gradient(90deg, transparent, white@14%, transparent)` que simula reflejo de luz.

---

## Los 6 tipos de workspace (corazón del producto)

| Tipo | Para qué sirve | Quién lo usa |
|---|---|---|
| **Lista** | Tareas en orden, prioridades, fechas | Equipos pequeños, focus diario |
| **Tablero** | Kanban con drag-and-drop entre estados | Sprints, flujos de trabajo |
| **Mapa mental** | Ideas conectadas en red visual | Brainstorming, planificación estratégica |
| **Calendario** | Mes/semana con eventos y deadlines | Marketing, contenido, agenda |
| **Cronograma** | Gantt con dependencias y plazos | Proyectos complejos, lanzamientos |
| **Flujograma** | Procesos con decisiones y bifurcaciones | Documentación de procesos, onboarding |

**Clave**: cada workspace puede tener **subvistas**. Empiezas en mapa mental y luego cambias a tablero sin perder datos. La estructura es la misma, la presentación cambia.

---

## Pantalla "Inicio" (lo que muestra el prototipo)

1. **Sidebar glass** con logo + crear nuevo + nav + lista de workspaces (cada uno con su color de gradient como chip).
2. **Hero** con tipografía grande Space Grotesk, gradient text en palabras clave, y meta-pill con pulso animado verde.
3. **Stats strip**: 4 cards 3D con iconos en gradient distinto (violeta, cyan, pink, lime) — tareas hoy, en progreso, atrasadas, completadas semana.
4. **"Empieza un workspace"**: grid 3×2 con los 6 tipos. Cada card tiene su icono en color + **preview visual real** de cómo se ve ese tipo (mini-list, mini-board, mini-mind-map, mini-calendar, mini-timeline, mini-flowchart). Los previews están inclinados 8° en eje X dando sensación de monitor flotante.
5. **Workspaces activos**: cards más grandes con glow orb del color del proyecto, status pill (activo/planeación/pausado), barra de progreso con glow y team avatars apilados.
6. **Activity feed**: lista cronológica de eventos del equipo con avatares en gradient y tags coloreados por workspace.
7. **FAB** (floating action button) abajo-derecha con gradient hero y glow doble (violeta + pink) — siempre presente para crear rápido.
8. **Command palette** (⌘K / ⌘N): abre modal glass con gradient borders y sugerencias categorizadas (Crear, Workspaces, Personas).

---

## Microinteracciones

- **Hover en cards**: lift + rotación parallax basada en posición del cursor (rotateX/Y).
- **Glow orbs en workspaces**: opacidad sube de 0.18 a 0.35 en hover.
- **Previews de tipo**: se enderezan (de rotateX 8° a 0°) y suben (translateY -4px) en hover de la card padre.
- **Pulse dot** en hero-meta: anillo expandiéndose 2s en loop.
- **Bg mesh**: 3 blobs de color flotando lentamente (18-22s ciclo).
- **Sidebar active item**: barra vertical de 3px con gradient hero y glow a la izquierda.

---

## Stack técnico (sin cambios mayores)

- **Next.js 15** App Router
- **Tailwind + custom CSS** para los efectos de profundidad
- **Framer Motion** para parallax y transiciones
- **dnd-kit** para drag and drop entre vistas
- **React Flow** para mind maps y flowcharts (la única librería pesada, justificada)
- **FullCalendar** para vista calendar
- **Postgres + Drizzle**, **Clerk**, infra ya descrita antes

---

## Lo que mantengo de la versión anterior

- Pricing simple sin add-ons (Free / Starter / Team / Business)
- Audiencia: equipos creativos 3-30 personas
- Cero features de IA
- Mobile-first respect
- Keyboard-first navigation (⌘K, ⌘N)
- Búsqueda universal

---

## Lo nuevo que define la marca Flux

1. **Dark mode default** (light mode opcional, no diseñado en este prototipo).
2. **Identidad cromática por proyecto**: cada workspace tiene su gradient asignado y aparece consistentemente en sidebar, card, icono y barra de progreso.
3. **6 tipos de proyecto como ciudadanos de primera clase** — no son "vistas", son tipos de workspace que puedes elegir al crear.
4. **Sensación de "interfaz viva"**: el fondo respira, las cards reaccionan al cursor, los glows pulsan. Sin caer en distracción.
5. **Tipografía Space Grotesk**: aporta carácter sin sacrificar legibilidad.

---

## Si esto te conecta, los siguientes pasos serían

1. Ajustar la paleta si los colores no te conectan (¿más fríos? ¿menos saturados? ¿incluir un tono específico?).
2. Diseñar las vistas internas detalladas de los 6 tipos (sobre todo mind map y flowchart, que son los más diferenciadores).
3. Diseñar el modal de **creación de workspace** (escoger tipo + plantilla + colaboradores en 30 segundos).
4. Diseñar el **detalle de tarea** (panel lateral o modal grande).
5. Versión light mode pastel (si te interesa para usuarios que prefieren claro).
6. Sistema de plantillas (Taskade tiene 1000+, podríamos curar 50-100 de calidad).

Abre el prototipo y dime si esta estética se acerca más a lo que buscas, o si quieres mover el dial (más sobrio, más colorido, menos glow, etc.).
