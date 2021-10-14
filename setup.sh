#!/bin/sh      
#                                           
# TTTTTTTTTTTTTTTTTTTTTTT              lllllll kkkkkkkk             iiii  
# T:::::::::::::::::::::T              l:::::l k::::::k            i::::i 
# T:::::::::::::::::::::T              l:::::l k::::::k             iiii  
# T:::::TT:::::::TT:::::T              l:::::l k::::::k                   
# TTTTTT  T:::::T  TTTTTTooooooooooo    l::::l  k:::::k    kkkkkkkiiiiiii 
#         T:::::T      oo:::::::::::oo  l::::l  k:::::k   k:::::k i:::::i 
#         T:::::T     o:::::::::::::::o l::::l  k:::::k  k:::::k   i::::i 
#         T:::::T     o:::::ooooo:::::o l::::l  k:::::k k:::::k    i::::i 
#         T:::::T     o::::o     o::::o l::::l  k::::::k:::::k     i::::i 
#         T:::::T     o::::o     o::::o l::::l  k:::::::::::k      i::::i 
#         T:::::T     o::::o     o::::o l::::l  k:::::::::::k      i::::i 
#         T:::::T     o::::o     o::::o l::::l  k::::::k:::::k     i::::i 
#       TT:::::::TT   o:::::ooooo:::::ol::::::lk::::::k k:::::k   i::::::i
#       T:::::::::T   o:::::::::::::::ol::::::lk::::::k  k:::::k  i::::::i
#       T:::::::::T    oo:::::::::::oo l::::::lk::::::k   k:::::k i::::::i
#       TTTTTTTTTTT      ooooooooooo   llllllllkkkkkkkk    kkkkkkkiiiiiiii
#                                                                       
# 2021 Ubuntu Shell setup script

sudo apt update
sudo apt upgrade -y


#  _                     _           
# | |                   | |          
# | |     ___   ___ __ _| | ___  ___ 
# | |    / _ \ / __/ _` | |/ _ \/ __|
# | |___| (_) | (_| (_| | |  __/\__ \
# |______\___/ \___\__,_|_|\___||___/

sudo apt install locales
sudo dpkg-reconfigure locales

#  ______ _____ _    _ 
# |___  // ____| |  | |
#    / /| (___ | |__| |
#   / /  \___ \|  __  |
#  / /__ ____) | |  | |
# /_____|_____/|_|  |_|

sudo apt install -y git zsh

# TODO Not really understanding the unattended install method
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Fast Syntax Highlighting
git clone https://github.com/zdharma/fast-syntax-highlighting.git \
	${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# TODO Copy my zshrc here

chsh -s $(which zsh)

#  _____       _   _                 
# |  __ \     | | | |                
# | |__) |   _| |_| |__   ___  _ __  
# |  ___/ | | | __| '_ \ / _ \| '_ \ 
# | |   | |_| | |_| | | | (_) | | | |
# |_|    \__, |\__|_| |_|\___/|_| |_|
#         __/ |                      
#        |___/                       

# TODO pyenv and poetry install, with a flag/prompt

#  _____             _             
# |  __ \           | |            
# | |  | | ___   ___| | _____ _ __ 
# | |  | |/ _ \ / __| |/ / _ \ '__|
# | |__| | (_) | (__|   <  __/ |   
# |_____/ \___/ \___|_|\_\___|_|   
#

# TODO prompt/flag

sudo apt remove docker docker-engine docker.io containerd runc

sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

sudo groupadd docker
sudo usermod -aG docker $USER

echo "Try running\n\tdocker run hello-world\nTo validate the Docker installation"

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# TODO Validate install
echo docker-compose --version
