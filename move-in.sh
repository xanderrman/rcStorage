#!/bin/sh
set -eu

rm -rf ~/tmp/movein
mkdir -p ~/tmp/movein
pushd ~/tmp/movein

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install \
  vault jq fx yh kubectl kubectx kubernetes-helm \
  go git tcpdump tmux tmate docker sipcalc tree watch \
  tldr bat tig coreutils ripgrep
brew cask install \
  visual-studio-code emacs iterm2 slack tunnelblick google-chrome \
  zoomus docker

popd ~/tmp/movein
rm -rf ~/tmp/movein
