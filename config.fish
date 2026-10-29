#abreviaciones
abbr -a .. 'cd ..'
abbr -a a 'sudo pacman -Syu'
abbr -a update 'sudo pacman -Syu'
abbr -a hs 'history search'
abbr -a e 'exit'
abbr -a gs 'git status'
abbr -a pdf 'soffice --convert-to pdf '
abbr -a su 'systemctl suspend'
abbr -a av 'source venv/bin/activate.fish'
abbr -a dv 'deactivate'
abbr -a venv 'python -m venv venv'
abbr -a h 'history'
abbr -a mp3 'yt-dlp -x --audio-format mp3 --no-playlist --audio-quality 0 ""' 
abbr -a gp 'git push origin main'
abbr -a dcu 'docker compose up -d'
abbr -a dcd 'docker compose down'
abbr -a rcc 'rclone copy Datos\ personales.txt gdrive:/DatosPersonales/'
abbr -a m 'mpv . --shuffle'
abbr -a gc 'google-chrome-stable'
abbr -a rc 'sudo paccache -r'
abbr -a show 'sushi'
abbr -a dl 'sudo pacman -S'
abbr -a iso 'sudo dd bs=4M if= of=/dev/sdb status=progress oflag=sync'
abbr -a pyserver 'python3 -m http.server 8000'
abbr -a add 'sudo nano /etc/hosts'
abbr -a nmap 'nmap -p- -sV -sC -Pn -T4 -oA'
abbr -a c 'clear'

zoxide init fish | source

function clean
  find ~/.cache -mindepth 1 -maxdepth 1 -exec rm -rf {} + 2>/dev/null
  sudo pacman -Sc
  yay -Sc
  set huerfanos (pacman -Qtdq)
  if test -n "$huerfanos"
    sudo pacman -Rns $huerfanos
  end
end

function changemac
    # Verificar si se proporcionó el nombre de la interfaz de red
    if test (count $argv) -eq 0
        echo "Uso: changemac <nombre_interfaz> (ejemplo: wlan0)"
        return 1
    end

    set interface $argv[1]
    echo "Cambiando la MAC de $interface..."

    # Ejecutar la secuencia de comandos
    sudo ip link set $interface down
    sudo macchanger -r $interface
    sudo ip link set $interface up

    echo "¡Listo! La nueva MAC ya está activa."
end

function originalmac
    # Verificar si se proporcionó el nombre de la interfaz de red
    if test (count $argv) -eq 0
        echo "Uso: changemac <nombre_interfaz> (ejemplo: wlan0)"
        return 1
    end

    set interface $argv[1]
    echo "Cambiando la MAC de $interface..."

    # Ejecutar la secuencia de comandos
    sudo ip link set $interface down
    sudo macchanger -p $interface
    sudo ip link set $interface up

    echo "¡Listo! La MAC original ya está activa."
end

set -gx GHIDRA_INSTALL_DIR /opt/ghidra
set -gx JAVA_HOME /usr/lib/jvm/java-21-openjdk
set -gx EDITOR nano
