# Propuesta estética: "Director's Cut"

> Rediseño visual completo para Prompt Builder Pro. No toca funcionalidad ni estructura de datos: es una capa nueva de identidad. Prototipo navegable en `prototype.html`.

---

## La idea en una frase

**La app se ve como el lugar donde se hace cine.** Hoy Prompt Builder habla de LUTs Kodak, cámaras ARRI, iluminación Rembrandt y DNA de Villeneuve, pero viste como una app de notas genérica. Esta propuesta la viste como una sala de etalonaje: oscura, cálida, precisa.

---

## Por qué es diferente a lo actual

| Hoy | Propuesta |
|---|---|
| Claro/oscuro neutro, sin identidad | Oscuro cálido de suite de color (off-black con temperatura) |
| DM Sans en todo | Display con carácter (Clash Display) + UI limpia (Switzer) + datos en mono (JetBrains Mono) |
| Sidebar de lista larga | Riel de iconos compacto + nombre al hover, gana ~180px de lienzo |
| Tarjetas de categoría iguales, planas | Bento editorial: tamaños mixtos, cada categoría con su atmósfera visual |
| Tags como pastillas grises uniformes | Chips de claqueta: borde fino, selección en tungsteno, impacto de sección visible en mono |
| Prompt en un cajón más | Consola fija inferior tipo timeline de edición: el prompt siempre presente, como en un NLE |

---

## Sistema visual

### Paleta (una sola, bloqueada)

| Token | Valor | Uso |
|---|---|---|
| `--bg-0` | `#0C0B09` | Fondo base (off-black cálido, nunca #000) |
| `--bg-1` | `#14120E` | Paneles, riel |
| `--bg-2` | `#1D1A14` | Superficies elevadas, chips |
| `--line` | `rgba(236,231,221,.08)` | Bordes hairline |
| `--text` | `#ECE7DD` | Texto principal (off-white cálido) |
| `--muted` | `#97907F` | Texto secundario |
| `--accent` | `#E2A33B` | Tungsteno. Único acento: selección, CTA, focos |

El acento es **luz tungsteno de set**: lo que ilumina un rodaje. Un solo acento en toda la página, saturación contenida, sin neones ni gradientes morados.

### Tipografía

- **Display:** Clash Display (Fontshare) en titulares y nombres de categoría. Tracking apretado, peso 600.
- **UI:** Switzer (Fontshare) para todo el cuerpo e interfaz.
- **Mono:** JetBrains Mono para lo técnico: impacto de sección, f-stops, ISO, contador de tags, el prompt mismo.

### Materialidad

- Sin tarjetas con sombra flotante: jerarquía por **hairlines y aire**, como un slate.
- Radio único de 10px en superficies, chips en pill. Regla documentada: superficies 10px, interactivos pill.
- Un solo "light leak" tungsteno fijo arriba a la derecha, al 5%, como fuga de luz en celuloide. Nada de mesh gradients.

### Motion (intensidad 6)

- Entrada en cascada (80ms de delay incremental) al cargar cada vista.
- Chips con lift físico al hover y `scale(.97)` al presionar.
- La consola del prompt "enciende" el botón de IA solo cuando hay contenido.
- Todo colapsa a estático bajo `prefers-reduced-motion`.

---

## Las 4 piezas nuevas de UX visual

1. **Riel de navegación** (72px): iconos Phosphor, etiqueta al hover. El espacio ganado va al contenido.
2. **Bento de categorías**: Imagen y Video como tiles grandes con atmósfera fotográfica; el resto en tiles tintados con icono display. Los 8 grupos se navegan con pestañas tipo "carrete".
3. **Consola de secciones**: cada sección del Builder es una franja de consola: impacto en mono a la izquierda (98, 96, 94...), nombre en display, chips a la derecha. Se lee como mesa de mezclas.
4. **Timeline del prompt**: barra fija inferior. El prompt crece ahí en mono, con Copiar / Guardar y el botón de IA en tungsteno. Siempre visible, como el timeline en Premiere.

---

## Cómo se aplicaría a la app real (sin riesgo)

La app ya usa variables CSS para todo el theming, así que el camino es incremental:

1. **Fase 1, tokens:** nuevo tema "Director's Cut" como preset de THEMES (la app ya soporta presets de tema). Solo variables: fondos, texto, acento. Reversible al instante.
2. **Fase 2, tipografía:** cargar Clash Display + Switzer + JetBrains Mono y mapearlas a las opciones de tipografía existentes del Panel de control.
3. **Fase 3, componentes:** chips, consola de secciones con impacto visible, riel de iconos. Es la fase con más trabajo (renderSection, sidebar) pero no cambia datos ni lógica.
4. **Fase 4, bento del Home:** sustituir el grid uniforme por el bento con pestañas de grupo.

El modo claro existente se conserva como opción; esta propuesta define el oscuro como identidad por defecto.

---

## Si esta dirección no conecta

Alternativas igual de ejecutables (pedir y prototipo):
- **Silver Halide:** frío de laboratorio fotográfico, plata/cromo/humo con un solo pop azul eléctrico.
- **Signal Red:** off-black neutro + gris cálido + rojo REC como único acento, más agresivo y broadcast.

Abre `prototype.html`, navega Inicio y Builder desde el riel, y dime qué mover.
