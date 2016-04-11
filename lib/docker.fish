function __docker_env --description 'Get Docker Machine environment variables'
	docker-machine env --shell fish $argv
end

function __docker_init --description 'Set up Docker environment'
  test (uname) = 'Darwin'; and eval (__docker_env)
end
