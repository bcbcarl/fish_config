if not command -s docker > /dev/null
  exit 1
end

if not command -s docker-machine > /dev/null
  exit 1
end

# docker-machine
alias dmstart 'docker-machine start'
alias dmrestart 'docker-machine restart'
alias dmstop 'docker-machine stop'
alias dmstatus 'docker-machine status'
alias dmenv 'docker-machine env --shell fish'
alias dmip 'docker-machine ip'

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

test (uname) = 'Darwin'; and eval (dmenv)
