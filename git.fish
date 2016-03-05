function _git_current_branch --description 'Show Git current branch'
  git name-rev --name-only HEAD
end

function _git_diff --description 'Fancy Git diffs'
  git diff --color $argv | diff-so-fancy | less --tabs=4 -RFX
end

alias ga 'git add'
alias gb 'git branch'
alias gba 'git branch --all'
alias gcmsg 'git commit -m'
alias gcb 'git checkout -b'
alias gd '_git_diff'
alias gdca '_git_diff --cached'
alias gdf 'git diff'
alias ggpush 'git push origin (_git_current_branch)'
alias glgga 'git log --graph --decorate --all'
alias gm 'git merge'
alias gp 'git push'
alias gr 'git remote'
alias grup 'git remote update'
alias grbi 'git rebase -i'
alias gsb 'git status -sb'
alias gst 'git status'
alias gsta 'git stash'
alias gstp 'git stash pop'
alias gup 'git pull --rebase'
