function __emacs_socket --description 'Set Emacs server socket'
  if test -d /tmp/emacs(id -u)
    set -l socket /tmp/emacs(id -u)/server
    echo $socket
    return
  end
  # Mac OS X
  if test (uname) = 'Darwin'
    if test -d (getconf DARWIN_USER_TEMP_DIR)emacs(id -u)
      set -l socket (getconf DARWIN_USER_TEMP_DIR)emacs(id -u)/server
      echo $socket
    end
  end
end

function __emacs_client --description 'Emacs client'
  if test (uname) = 'Darwin'
    emacsclient -s (__emacs_socket) -n $argv
    return
  end
  emacsclient $argv
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
    return
  end
  __emacs_daemon_linux
end

function __emacs_run --description 'Emacs launcher'
  __emacs_daemon
  if test (uname) = 'Darwin'
    # Create new frame if no existing frames
    set -l cmd '(length (visible-frame-list))'
    set -l frame_count (__emacs_client --eval $cmd 2>/dev/null)
    if test "$frame_count" -eq 1
      __emacs_client -c $argv
      return
    end
  end
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
