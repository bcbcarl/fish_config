set -g fish_path "$HOME/.config/fish"
set -x PATH "/usr/local/sbin" $PATH

if test (uname) = 'Linux'
  set -x PATH "$HOME/.bin" $PATH
end

set -l plugins git pyenv rbenv emacs docker

for plugin in $plugins
  set -l fish_lib $fish_path/lib/$plugin.fish
  [ -f $fish_lib ]; and source $fish_lib
  source $fish_path/plugins/$plugin.fish
end
