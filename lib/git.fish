function __git_current_branch --description 'Show Git current branch'
  git name-rev --name-only HEAD
end

function __git_diff --description 'Fancy Git diffs'
  if command -s diff-so-fancy > /dev/null
    git diff --color $argv | diff-so-fancy | less --tabs=4 -RFX
  else
    git diff --color $argv
  end
end
