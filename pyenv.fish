set -l pyenv_root ''

if test -z "$PYENV_ROOT"
  set pyenv_root "$HOME/.pyenv"
  set -x PYENV_ROOT "$HOME/.pyenv"
else
  set pyenv_root "$PYENV_ROOT"
end

set -x PATH $pyenv_root/bin $PATH

if not command -s pyenv > /dev/null
  exit 1
end

status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
