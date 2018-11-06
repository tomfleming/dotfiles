# load oh-my-zsh + plugins
export OMZ_ROOT=$HOME/.oh-my-zsh
export ZSH=$OMZ_ROOT  # oh-my-zsh requires this ENV variable for some reason
source $OMZ_ROOT/oh-my-zsh.sh
plugins=(git colored-man-pages history-substring-search)


# enable pure prompt
autoload -U promptinit; promptinit
prompt pure


# configure PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/Library/TeX/texbin"
export PATH="$CUDA_HOME/bin:$PATH"  # for GPU
export PATH="$HOME/.cargo/bin:$PATH"  # for Rust


# enable zsh auto-completion
autoload -Uz compinit && compinit
eval "$(pipenv --completion)"


# configure CUDA
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"


# set personal aliases
alias docker-cleanup='docker rm -v $(docker ps -a -q -f status=exited); docker rmi $(docker images -f "dangling=true" -q)'
alias doco="docker-compose"
alias ls="ls -GFlsh"
alias vim="nvim"
alias vimdiff="nvim -d"


# run tmux automatically at shell startup
function ttmux {
	if (pgrep tmux); then
		tmux attach
	else
        tmux
	fi
    builtin exit
}


# configure fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="git ls-files 2>/dev/null || find . -type f"


# configure node version manager (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# load pyenv (python version manager)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# load rbenv to manage ruby versions
eval "$(rbenv init -)"
