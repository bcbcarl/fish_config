function __emacs_socket --description 'Set Emacs server socket'
  set -l socket /tmp/emacs(id -u)/server
  if not test -e $socket
    test (uname) = 'Darwin'; and set -l socket (getconf DARWIN_USER_TEMP_DIR)emacs(id -u)/server
  end
  echo $socket
end

function __emacs_client --description 'Emacs client'
  set -l socket (__emacs_socket)
  if test (uname) = 'Darwin'
    emacsclient -s $socket -n $argv
    return
  end
  emacsclient -c $argv
end

function __emacs_daemon_linux --description 'Emacs daemon (Linux)'
  if test -z (pgrep emacs)
    emacs --daemon
  end
end

function __emacs_daemon_mac --description 'Emacs daemon (Mac)'
  if test -z (pgrep Emacs)
    emacs --daemon
  end
end

function __emacs_daemon --description 'Emacs daemon'
  if test (uname) = 'Darwin'
    __emacs_daemon_mac
  else
    __emacs_daemon_linux
  end
end

function __emacs_run --description 'Emacs launcher'
  __emacs_daemon
  # Create new frame if no existing frames
  set -l cmd '(length (visible-frame-list))'
  set -l frame_count (__emacs_client --eval $cmd 2>/dev/null)
  test $frame_count -eq 1; and __emacs_client -c $argv; and return
  __emacs_client $argv
end

function __emacs_eeval --description '
Same than M-x eval but from outside Emacs.
'
  __emacs_run --eval $argv
end

function __emacs_eframe --description '
Create a new Emacs frame.
'
  __emacs_run -n -c $argv
end

function __emacs_efile --description '
  Write to standard output the path to the file opened in the current buffer.
'
  set -l cmd '(buffer-file-name (window-buffer))'
  __emacs_eeval $cmd | tr -d '\"'
end

function __emacs_ecd --description '
  Write to standard output the directory of the file opened in the the current
  buffer.
'
  set -l cmd '(let ((buf-name (buffer-file-name (window-buffer))))
                (if buf-name (file-name-directory buf-name)))'
  set -l dir (__emacs_eeval $cmd | tr -d '\"')

  if test -n "$dir"
    echo $dir
  else
    echo 'cannot deduce current buffer filename.' >/dev/stderr
  end
end

function __emacs_kill
  __emacs_eeval '(kill-emacs)' 2>/dev/null
end
