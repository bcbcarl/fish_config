set -l rbenv_root ''

if test -z "$RBENV_ROOT"
  set rbenv_root "$HOME/.rbenv"
  set -x RBENV_ROOT "$HOME/.rbenv"
else
  set rbenv_root "$RBENV_ROOT"
end

set -x PATH $rbenv_root/bin $PATH

if not command -s rbenv > /dev/null
  exit 1
end

status --is-interactive; and . (rbenv init -|psub)
