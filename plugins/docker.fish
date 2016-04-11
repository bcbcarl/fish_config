if not command -s docker > /dev/null
  exit 1
end

# docker-machine is needed if you're using Mac OS X
if test (uname) = 'Darwin'
  if not command -s docker-machine > /dev/null
    exit 1
  end
  if not command -s virtualbox > /dev/null
    exit 1
  end
end

set -l dmenv '__docker_env'

# docker
abbr -a d docker
alias dver 'docker version'
alias dimg 'docker images'
alias dbuild 'docker build'
alias drm 'docker rm'
alias drmi 'docker rmi'
alias datt 'docker attach'
alias dstart 'docker start'
alias dstop 'docker stop'
alias drun 'docker run'
alias dsearch 'docker search'
alias dpush 'docker push'
alias dps 'docker ps'
alias dpsa 'docker ps -a'

# docker-machine is optional if you're using native Docker
if command -s docker-machine > /dev/null
  alias dmver 'docker-machine version'
  alias dmstart 'docker-machine start'
  alias dmrestart 'docker-machine restart'
  alias dmstop 'docker-machine stop'
  alias dmstatus 'docker-machine status'
  alias dmls 'docker-machine ls'
  alias dmenv $dmenv
  alias dmip 'docker-machine ip'
end

__docker_init
