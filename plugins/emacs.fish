if not command -s emacs > /dev/null
  exit 1
end

set -l emacs '__emacs_run'
set -l eeval '__emacs_eeval'
set -l eframe '__emacs_eframe'
set -l efile '__emacs_efile'
set -l ecd '__emacs_ecd'
set -l ekill '__emacs_kill'

abbr -a e $emacs
alias ec $eframe
alias eeval $eeval
alias eframe $eframe
alias efile $efile
alias ecd $ecd
alias ekill $ekill
