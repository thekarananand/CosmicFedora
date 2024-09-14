# Make DNF Faster 
sudo sh -c 'cat << EOF >> /etc/dnf/dnf.conf
fastestmirror=True
max_parallel_downloads=10
EOF'

# Enable RPM Fusion (free & non-free)
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# Install DNF Packages
sudo dnf install -y intel-media-drivers
sudo dnf install -y jetbrains-mono-fonts
sudo dnf install -y powerline-fonts
sudo dnf install -y git
sudo dnf install -y gh
sudo dnf install -y vlc
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-plugin-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

sudo dnf update

sudo dnf copr enable ryanabx/cosmic-epoch
sudo dnf install cosmic-desktop

sudo systemctl disable display-manager
sudo systemctl set-default graphical.target

sudo systemctl enable cosmic-greeter

sudo cp /etc/pam.d/greetd /etc/pam.d/cosmic-greeter

sudo systemctl start cosmic-greeter
