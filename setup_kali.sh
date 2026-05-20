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

# 4. Instalar herramientas de productividad
echo "[+] Instalando capturador de pantalla y plugins de terminal..."
sudo apt install -y flameshot zsh-syntax-highlighting zsh-autosuggestions

echo "[*] ¡Paquetes instalados con éxito!"
echo "[*] Siguiente paso: asegúrate de estar en ~/dotfiles y ejecuta 'stow i3 zsh tmux' para enlazar tus configuraciones."
