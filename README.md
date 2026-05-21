# 💀 Kali Linux — Minimalist Dotfiles

> Repositorio personal con la configuración de mi entorno de trabajo y laboratorio de auditoría en **Kali Linux (Persistent USB)**. Construido desde cero para optimizar el consumo de recursos, minimizar el desgaste de escritura y maximizar la productividad usando atajos de teclado.

---

## Herramientas Principales

| Categoría             | Herramienta                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Window Manager**    | `i3wm` (Tiling manual) + `autotiling` (Tiling dinámico en espiral)         |
| **Compositor**        | `Picom` — Sombras oscuras, bordes redondeados, transparencias sin blur      |
| **Gestor de Dotfiles**| `GNU Stow` — Manejo de enlaces simbólicos sin scripts complejos             |
| **Terminal & Shell**  | `Zsh` + `Tmux` + `Fastfetch`                                               |
| **Lanzador**          | `Rofi`                                                                      |
| **Utilidades**        | `Feh` (fondos de pantalla ligeros) · `Flameshot` (capturas con anotaciones)|

---

## Instalación y Despliegue Automático

El repositorio incluye un script en la raíz que instala todas las dependencias del sistema (audio, brillo, reproductores multimedia y utilidades gráficas).

### 1. Clonar el repositorio

```bash
git clone git@github.com:elesteber/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Ejecutar el script base

```bash
./setup_kali.sh
```

> Este script instala todas las dependencias necesarias via `apt`.

### 3. Desplegar los enlaces simbólicos con Stow

```bash
stow i3 zsh tmux picom scripts
```

---

##  Atajos de Teclado (Keybindings)

###  Gestión de i3wm

> `Mod` = tecla **Super** (Windows)

#### Sistema

| Atajo                             | Acción                                                          |
|-----------------------------------|-----------------------------------------------------------------|
| `Mod + Shift + C`                 | Recarga suave de la configuración (aplica atajos nuevos)        |
| `Mod + Shift + R`                 | Reinicio forzado de i3wm (revive Picom, Feh y autotiling)       |
| `Mod + Shift + E`                 | Salir de i3wm (cierra la sesión)                                |
| `Mod + Shift + Q`                 | Cierra la ventana activa                                        |

#### Navegación entre ventanas

| Atajo                             | Acción                                                          |
|-----------------------------------|-----------------------------------------------------------------|
| `Mod + ←/→/↑/↓`                  | Mover el foco entre ventanas (también funciona con `H/J/K/L`)   |
| `Mod + A`                         | Mover el foco al **contenedor padre** (útil en layouts anidados)|

> **Tip:** `H/J/K/L` son las direcciones al estilo Vim: izquierda / abajo / arriba / derecha.

#### Mover y reorganizar ventanas

| Atajo                             | Acción                                                          |
|-----------------------------------|-----------------------------------------------------------------|
| `Mod + Shift + ←/→/↑/↓`          | Mueve la ventana activa en esa dirección dentro del layout      |
| `Mod + Shift + H/J/K/L`          | Igual que arriba, versión Vim                                   |
| `Mod + Shift + Barra Espaciadora` | Alterna la ventana entre modo **Tiling** y **Flotante**         |
| `Mod + Clic izquierdo` (en float) | Arrastra una ventana flotante con el mouse                      |
| `Mod + Clic derecho` (en float)   | Redimensiona una ventana flotante con el mouse                  |

#### Layouts (disposición de ventanas)

| Atajo             | Acción                                                                  |
|-------------------|-------------------------------------------------------------------------|
| `Mod + E`         | Layout **Split** — divide horizontal o verticalmente según el espacio   |
| `Mod + S`         | Layout **Stacking** — ventanas apiladas, una visible a la vez           |
| `Mod + W`         | Layout **Tabbed** — ventanas en pestañas, navegables con `Mod + ←/→`   |
| `Mod + H`         | Fuerza el próximo split en **horizontal**                               |
| `Mod + V`         | Fuerza el próximo split en **vertical**                                 |
| `Mod + F`         | **Pantalla completa** para la ventana activa (toggle)                   |

> **Tip:** Con `autotiling` activo, el split se elige automáticamente según si el espacio disponible es más ancho o alto, así que `Mod + H` y `Mod + V` se usan menos, pero es útil conocerlos para forzar una dirección puntual.

#### Workspaces (escritorios virtuales)

| Atajo                         | Acción                                                        |
|-------------------------------|---------------------------------------------------------------|
| `Mod + 1` … `Mod + 9`        | Cambiar al workspace número N                                 |
| `Mod + Shift + 1` … `+ 9`    | **Mover** la ventana activa al workspace número N             |
| `Mod + Tab`                   | Volver al workspace anteriormente activo (toggle)             |

### Control de Hardware (HP Omen o similares)

| Atajo                   | Acción                                  | Backend         |
|-------------------------|-----------------------------------------|-----------------|
| `Fn + F5`               | Mutear / desmutear audio                | `pactl`         |
| `Fn + F6`               | Bajar volumen                           | `pactl`         |
| `Fn + F7`               | Subir volumen                           | `pactl`         |
| Teclas de brillo        | Ajustar brillo de pantalla              | `brightnessctl` |
| `F8`                    | Reproducción anterior / Stop            | `playerctl`     |
| `F9`                    | Play / Pause                            | `playerctl`     |
| `F10`                   | Siguiente pista                         | `playerctl`     |

### Utilidades

| Atajo      | Acción                                                              |
|------------|---------------------------------------------------------------------|
| `Mod + D`  | Abre el menú de aplicaciones (**Rofi**)                             |
| `Imp Pnt`  | Congela la pantalla para capturas y anotaciones (**Flameshot**)     |

---

## Estructura del Repositorio

```
dotfiles/
├── i3/
│   └── .config/i3/config
├── zsh/
│   └── .zshrc
├── tmux/
│   └── .tmux.conf
├── picom/
│   └── .config/picom/picom.conf
├── scripts/
│   └── .local/bin/
└── setup_kali.sh
```

---

## Notas sobre USB Persistente

- La configuración está optimizada para **minimizar escrituras en flash** y reducir el desgaste del pendrive.
- Se recomienda montar `/tmp` y los logs en `tmpfs` (RAM) para evitar escrituras innecesarias.
- Stow crea **enlaces simbólicos**, no copias, lo que mantiene el sistema limpio y fácil de actualizar.

---

## Flujo de Trabajo Git

```bash
git add README.md
git commit -m "docs: agregado README con instrucciones de instalacion y atajos"
git push
```

---

*Configuración mantenida por [@elesteber](https://github.com/elesteber)*
