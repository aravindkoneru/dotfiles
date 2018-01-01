#Go home
cd ~

#Install xcode tools
xcode-select --install

#Install homebrew and cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

#Install languages
brew install opam
brew install ocaml
brew install node
brew install python3
brew cask install java

#Install tools
brew install wget
brew install nmap
brew install git

#Install Programs
brew cask install the-unarchiver
brew cask install google-chrome
brew cask install appcleaner
brew cask install slack
brew cask install iterm2
brew cask install sublime-text
brew cask install flux
brew cask install transmission
brew cask install dropbox
brew cask install cyberduck
brew cask install vlc
brew cask install macvim 
brew install vim --with-override-system-vi

#Setup git
mkdir ~/git/

git config --global user.name "Aravind Koneru"
git config --global user.email "aravind.b.koneru@gmail.com"

#Generate ssh keys
ssh-keygen -t rsa 4096 -C "aravind.b.koneru@gmail.com"
ssh-add -L ~/.ssh/id_rsa

pbcopy < ~/.ssh/id_rsa.pub
echo "ssh key copied to clipboard, add it to github"

#Set up vim 
git clone https://github.com/aravindkoneru/dotfiles.git
ln -s ~/dotfiles/.vimrc 
ln -s ~/dotfiles/.vim 

#Install fish and oh-my-fish
brew install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

curl -L https://get.oh-my.fish | fish
