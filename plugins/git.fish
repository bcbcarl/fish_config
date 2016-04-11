set -l git_diff '__git_diff'
set -l git_current_branch '__git_current_branch'

abbr -a ga git add
abbr -a gb git branch
abbr -a gba git branch --all
abbr -a gcb git checkout -b
abbr -a gcm git checkout master
abbr -a gcmsg git commit -m
abbr -a gd $git_diff
abbr -a gdca $git_diff --cached
abbr -a gdf git diff
abbr -a gf git fetch
abbr -a gfa git fetch --all --prune
abbr -a ggpush git push origin $git_current_branch
abbr -a glgga git log --graph --decorate --all
abbr -a gm git merge
abbr -a gp git push
abbr -a gr git remote
abbr -a gra git remote add
abbr -a grup git remote update
abbr -a grbi git rebase -i
abbr -a gsb git status -sb
abbr -a gst git status
abbr -a gsta git stash
abbr -a gstp git stash pop
abbr -a gup git pull --rebase
