#!/usr/bin/env bash
set -e 

echo 'Rodando!'
### Configurando script ###
ppas=(lutris-team/lutris)
repositorio_flatpak=("https://flathub.org/repo/flathub.flatpakrepo")
downloads=(
"https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
"https://dl.winehq.org/wine-builds/winehq.key"
"https://github.com/Braasileiro/DeezerRPC/releases/download/1.0.2/DeezerRPC-1.0.2.AppImage"
)

pacotes_apt=(winff ffmpeg youtube-dl neofetch mpv gnome-boxes gnome-tweaks obs-studio vlc steam-installer firefox lutris openjdk-8-jdk nodejs flatpak gnome-software-plugin-flatpak gnome-software adwaita-icon-theme-full git curl)
pacotes_apt_recomendados=(winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 winetricks)

libs_32bits=(gnutls30 ldap-2.4-2 gpg-error0 xml2 asound2-plugins sdl2-2.0-0 freetype6 dbus-1-3 sqlite3-0)

snaps=(spotify qbittorrent-arnatious photogimp)
snaps_classic=(code)

flatpaks=(org.telegram.desktop com.stremio.Stremio com.system76.Popsicle com.discordapp.Discord)

chaves=(winehq.key)

### Iniciando a instalação ###
echo 'Iniciando a instalação!'

cd $(mktemp -d)
wget -nv -c ${downloads[@]}
dpkg --add-architecture i386 
apt-key add ${chaves[@]}
apt update
add-apt-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' 

echo 'Adicionando PPAs'
echo
for ppa in ${ppas[@]}; do
  apt-add-repository "ppa:"$ppa  -y
done

rm -rf /etc/apt/preferences.d/nosnap.pref
apt update

echo
echo 'Instalando pacotes do APT'
echo
apt-get remove "openjdk-*"
apt install "snapd" ${pacotes_apt[@]} -y
apt install --install-recommends  ${pacotes_apt_recomendados[@]} -y
sudo apt install $(echo "${libs_32bits[@]}" | tr ' ' '\n' | awk '{print "lib"$1":i386"}' | tr '\n' ' ')

echo 'Instalando Snaps e Flatpaks'
snap install ${snaps[@]}
snap install --classic ${snaps_classic[@]}
flatpak remote-add --if-not-exists flathub ${repositorio_flatpak[@]}
flatpak install flathub -y ${flatpaks[@]}

echo 'Configurando AppImages'
mkdir $HOME/Applications
mv *.AppImage $HOME/Applications
chmod 777 -r $HOME/Applications/

wget "https://github.com/AppImage/appimaged/releases/download/continuous/appimaged-x86_64.AppImage"
chmod +x appimaged-x86_64.AppImage
./appimaged-x86_64.AppImage --install

echo 'Configurando GNOME'
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click  true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

echo 'Atualizando o sistema'
apt dist-upgrade -y
apt full-upgrade
apt autoclean 

neofetch

echo
echo
echo "Instalação finalizada, é recomendado reiniciar o sistema."
echo "thx! :P"
echo 
