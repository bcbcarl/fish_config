set -x PATH "$HOME/.rbenv/bin" $PATH
status --is-interactive; and . (rbenv init -|psub)
