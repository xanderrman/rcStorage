#!/bin/sh
set -eu

rm -rf ~/tmp/movein
mkdir -p ~/tmp/movein
pushd ~/tmp/movein

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install \
  # CLI tools
  jq jsonlint fx yh yamllint tcpdump tmux tmate sipcalc \
  tree watch tldr bat tig ripgrep kubectx htop httpie \
  moreutils icdiff
  # big boi CLI clients
  vault kubernetes-cli helm vault terraform docker mysql \
  #programmer things
  go git neovim

brew install --cask \
  visual-studio-code emacs iterm2 slack tunnelblick google-chrome \
  zoomus docker muzzle spotify tableplus rectangle vagrant

popd ~/tmp/movein
rm -rf ~/tmp/movein

# allow holding down a key to repeat it on macos
defaults write -g ApplePressAndHoldEnabled -bool false

echo "you're most of the way there, you just gotta go download some stuff still..."
echo "https://www.nerdfonts.com/font-downloads"
echo "https://github.com/lensapp/lens/releases"
echo
echo "grab the tarball zip of master from..."
echo "that said maybe check if this is in moreutils first :thinking_face:"
echo "https://github.com/arielf/cuts/"
echo
echo "grab this file too (also next time automate this you goon)"
echo "https://github.com/rupa/z/blob/master/z.sh"
