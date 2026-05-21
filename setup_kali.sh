#!/bin/bash

# Detener el script si ocurre algún error
set -e

echo "[*] Iniciando el script de automatización definitivo de Kali..."

# 1. Actualizar la base de datos de paquetes
echo "[+] Actualizando repositorios..."
sudo apt update -y

# 2. Instalar el entorno base y el multiplexor
echo "[+] Instalando i3wm, tmux y gestores de versiones..."
sudo apt install -y i3 i3status tmux git stow

# 3. Instalar herramientas de hardware (Audio, Brillo y Multimedia)
echo "[+] Instalando controladores de hardware..."
sudo apt install -y pavucontrol pulseaudio-utils brightnessctl playerctl

# 4. Instalar herramientas de productividad y estética (Ricing)
echo "[+] Instalando herramientas de captura, plugins de terminal y entorno visual..."
sudo apt install -y flameshot zsh-syntax-highlighting zsh-autosuggestions picom feh rofi fastfetch python3-i3ipc

echo "[*] ¡Todos los paquetes esenciales han sido instalados con éxito!"
echo "[*] Siguiente paso opcional: ejecuta 'stow i3 zsh tmux picom scripts' para enlazar tus configuraciones."
