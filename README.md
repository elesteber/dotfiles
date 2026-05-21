# 💀 Kali Linux — Minimalist Dotfiles

> Repositorio personal con la configuración de mi entorno de trabajo y laboratorio de auditoría en **Kali Linux (Persistent USB)**. Construido desde cero para optimizar el consumo de recursos, minimizar el desgaste de escritura y maximizar la productividad usando atajos de teclado.

---

##  Herramientas Principales

| Categoría             | Herramienta                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Window Manager**    | `i3wm` (Tiling manual) + `autotiling` (Tiling dinámico en espiral)         |
| **Compositor**        | `Picom` — Sombras oscuras, bordes redondeados, transparencias sin blur      |
| **Gestor de Dotfiles**| `GNU Stow` — Manejo de enlaces simbólicos sin scripts complejos             |
| **Terminal & Shell**  | `Zsh` + `Tmux` + `Fastfetch`                                               |
| **Lanzador**          | `Rofi`                                                                      |
| **Utilidades**        | `Feh` (fondos de pantalla ligeros) · `Flameshot` (capturas con anotaciones)|

---

##  Instalación y Despliegue Automático

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

###  Control de Hardware (HP Omen o similares)

| Atajo                   | Acción                                  | Backend         |
|-------------------------|-----------------------------------------|-----------------|
| `Fn + F5`               | Mutear / desmutear audio                | `pactl`         |
| `Fn + F6`               | Bajar volumen                           | `pactl`         |
| `Fn + F7`               | Subir volumen                           | `pactl`         |
| Teclas de brillo        | Ajustar brillo de pantalla              | `brightnessctl` |
| `F8`                    | Reproducción anterior / Stop            | `playerctl`     |
| `F9`                    | Play / Pause                            | `playerctl`     |
| `F10`                   | Siguiente pista                         | `playerctl`     |

###  Utilidades

| Atajo      | Acción                                                              |
|------------|---------------------------------------------------------------------|
| `Mod + D`  | Abre el menú de aplicaciones (**Rofi**)                             |
| `Imp Pnt`  | Congela la pantalla para capturas y anotaciones (**Flameshot**)     |

---

##  Estructura del Repositorio

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
├── wallpapers/
│   └── wallpaper.jpg
└── setup_kali.sh
```

---

##  Optimizaciones del Sistema (USB Persistente)

Para maximizar la vida útil de la memoria flash y minimizar los cuellos de botella por I/O, se aplicaron las siguientes configuraciones a nivel de kernel y sistema de archivos.

### Reducción de escritura en disco (`/etc/fstab`)

Se añadió `noatime` a la partición raíz para evitar que el sistema registre la fecha de "último acceso" cada vez que lee un archivo — por defecto Linux hace esa escritura silenciosamente en cada lectura, lo cual en flash es puro desgaste gratuito.

Además se montaron los directorios de mayor volatilidad directamente en RAM con `tmpfs`:

```fstab
# === Optimización para USB Flash ===
tmpfs   /tmp                  tmpfs   defaults,noatime,nosuid,mode=1777,size=512m  0 0
tmpfs   /var/log              tmpfs   defaults,noatime,nosuid,size=64m             0 0
tmpfs   /var/tmp              tmpfs   defaults,noatime,nosuid,size=64m             0 0
tmpfs   /var/lib/pulse        tmpfs   defaults,noatime,nosuid,size=16m             0 0
tmpfs   /root/.cache          tmpfs   defaults,noatime,nosuid,size=256m            0 0
```

> **Nota:** Los logs en `tmpfs` se pierden al apagar. En un entorno de auditoría esto es generalmente aceptable, y tiene la ventaja adicional de no dejar rastros de actividad en el pendrive.

Para aplicar los cambios de `fstab` sin reiniciar:
```bash
sudo mount -a
```

### Gestión de memoria RAM y Swap

Con 16 GB de RAM, el kernel no debería tocar swap casi nunca. Para asegurarlo:

```bash
# Agregar en /etc/sysctl.conf
vm.swappiness=1
```

Aplicar sin reiniciar:
```bash
sudo sysctl -p
```

Verificar que quedó:
```bash
cat /proc/sys/vm/swappiness  # debe devolver 1
```

### Caché del navegador en RAM (Firefox)

En `about:config`, se configuraron los siguientes parámetros para que Firefox no escriba caché en el pendrive durante la navegación:

| Parámetro                      | Valor   |
|--------------------------------|---------|
| `browser.cache.disk.enable`    | `false` |
| `browser.cache.memory.enable`  | `true`  |

### Control del historial de Zsh

Se ajustaron los límites en `.zshrc` para que el historial sobreviva a los reinicios (al contrario de enviarlo a `tmpfs`), pero sin crecer descontroladamente:

```zsh
HISTSIZE=1000
SAVEHIST=1000
```

> El historial es especialmente valioso en un entorno de auditoría donde se ejecutan comandos largos y poco frecuentes que conviene recuperar con la flechita arriba.

---

##  Estética (i3wm + Picom)

El entorno visual tiene una temática rojiza oscura, priorizando rendimiento sin sacrificar el apartado visual.

### Tiling dinámico con `autotiling`

Se integró el script `autotiling` (de nwg-piotr) ejecutado en segundo plano desde i3. Convierte el tiling manual de i3wm en un **tiling dinámico en espiral**: el split se elige automáticamente según si el espacio disponible es más ancho o alto, similar a cómo funciona AwesomeWM o bspwm.

```bash
exec_always --no-startup-id ~/dotfiles/scripts/autotiling
```

### Colores de bordes (i3wm)

Se reemplazaron los colores por defecto con una paleta personalizada definida en el `config` de i3:

| Variable         | Color     | Uso                                          |
|------------------|-----------|----------------------------------------------|
| `$focused_red`   | `#8b0000` | Borde e indicador de la ventana con foco     |
| `$bg_dark`       | `#1d2021` | Fondo de ventanas inactivas / sin foco       |
| `$text_light`    | `#ebdbb2` | Texto en las barras de título                |

### Composición gráfica (Picom)

Configurado en `~/.config/picom/picom.conf` con:

- **Transparencias** — 95% para ventanas activas, 85% para inactivas
- **Sombras suaves** — para dar relieve a las ventanas flotantes
- **Bordes redondeados** — `corner-radius = 10`, excluyendo barras de estado (`dock`)
- **Sin blur** — para no activar innecesariamente la GPU durante el trabajo

### Wallpaper con `feh`

El fondo de pantalla se gestiona desde el repositorio (`~/dotfiles/wallpapers/`) y se carga de forma estática y ligera:

```bash
exec_always --no-startup-id feh --bg-fill ~/dotfiles/wallpapers/wallpaper.jpg
```

`feh` no genera cachés ocultas ni procesos en segundo plano — carga la imagen una vez y termina.

---

## Flujo de Trabajo Git

```bash
git add README.md
git commit -m "docs: agregado README con instrucciones de instalacion y atajos"
git push
```

---

*Configuración mantenida por [@elesteber](https://github.com/elesteber)*
