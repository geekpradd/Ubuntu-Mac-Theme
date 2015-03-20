refresh (){
	sudo apt-get update
}

install (){
	sudo apt-get install $1
}
#Add the PPAs and refresh apt
sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository ppa:docky-core/ppa
refresh 
echo "PPA added"

#Install Theme and icon
echo "Installing GTK theme and Icons"
install mbuntu-y-ithemes-v4
install mbuntu-y-icons-v4

echo "Setting Theme and Icons"
gsettings set org.gnome.desktop.interface gtk-theme "Mbuntu-y-for-unity"
gsettings set org.gnome.desktop.interface icon-theme "Mbuntu-os-y"

echo "Installing Docky"
install docky 
install mbuntu-y-docky-skins-v4

echo "Installing Mac OS X Splashscreen"
install mbuntu-y-bscreen-v4

echo "Changing Ubuntu Desktop Text to Mac OS X"
cd && wget -O Mac.po http://drive.noobslab.com/data/Mac-14.10/change-name-on-panel/mac.po
cd /usr/share/locale/en/LC_MESSAGES; sudo msgfmt -o unity.mo ~/Mac.po;rm ~/Mac.po;cd

echo "Removing dots from Login page"

sudo xhost +SI:localuser:lightdm
sudo su lightdm -s /bin/bash
gsettings set com.canonical.unity-greeter draw-grid false;exit
sudo mv /usr/share/unity-greeter/logo.png /usr/share/unity-greeter/logo.png.backup
cd;wget -O logo.png http://drive.noobslab.com/data/Mac-14.10/ubuntu_logo.png
sudo mv logo.png /usr/share/unity-greeter/;gsettings set com.canonical.unity-greeter draw-grid false

echo "Adding Apple Logo to Launcher"

wget -O launcher_bfb.png http://drive.noobslab.com/data/Mac-14.10/launcher-logo/apple/launcher_bfb.png
sudo mv launcher_bfb.png /usr/share/unity/icons/

echo "Finished.. Everything should be installed.. You might want to logout and login again to see all changes"