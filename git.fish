alias ga 'git add'
alias gb 'git branch'
alias gba 'git branch --all'
alias gcmsg 'git commit -m'
alias gcb 'git checkout -b'
function gd
  git diff --color $argv | diff-so-fancy | less --tabs=4 -RFX
end
alias gdf 'git diff'
alias glgga 'git log --graph --decorate --all'
alias gm 'git merge'
alias gp 'git push'
alias gr 'git remote'
alias grbi 'git rebase -i'
alias gsb 'git status -sb'
alias gst 'git status'
alias gsta 'git stash'
alias gstp 'git stash pop'
alias gup 'git pull --rebase'
