#!/bin/bash

git config --global user.name  "Alex Anelli"
git config --global user.email atanelli@protonmail.com

git config --global alias.st "status"
git config --global alias.ci "commit"
git config --global alias.cia "commit --amend"
git config --global alias.br "branch"
git config --global alias.co "checkout"

git config --global alias.df  "diff"
git config --global alias.dfc "diff --cached"
git config --global alias.dfp "diff --stat -p"

git config --global alias.who "shortlog -s --"
git config --global alias.lg "log -n 20 --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %an (via %cn)' --abbrev-commit --date=relative"

git config --global alias.last "cat-file commit HEAD"
git config --global alias.stc "diff --stat --name-status --cached"
#git config --global alias.up "!git remote update ; git gc"
git config --global alias.log1 "log --pretty=oneline --abbrev-commit --decorate"

#git config --global alias.lc "log ORIG_HEAD.. --stat --no-merges"
#git config --global alias.undo "reset --hard"

git config --global alias.ss  "stash save"
git config --global alias.sp  "stash pop"
git config --global alias.sls "stash list"

git config --global alias.subu "submodule update"

git config --global color.ui auto
git config --global color.diff auto

git config --global color.diff.new "green bold"
git config --global color.diff.old "red bold"
git config --global color.diff.meta "white"
git config --global color.diff.func "magenta bold"
git config --global color.diff.frag "yellow bold"
git config --global color.diff.whitespace "blue reverse"

git config --global color.status.added "green bold"
git config --global color.status.changed "red bold"
git config --global color.status.untracked "cyan bold"

git config --global core.excludesFile "~/.gitignore"
git config --global pull.rebase true
git config --global init.defaultBranch main
