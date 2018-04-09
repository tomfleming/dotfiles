alias ls="ls -GFlsh"
alias vim="mvim -v"
alias vimdiff="mvimdiff -v"
alias docker-cleanup='docker rm -v $(docker ps -a -q -f status=exited); docker rmi $(docker images -f "dangling=true" -q)'
alias doco="docker-compose"
