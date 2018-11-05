# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages history-substring-search)

# enable pure prompt
autoload -U promptinit; promptinit
prompt pure

# PATH configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/Library/TeX/texbin"
export PATH="$CUDA_HOME/bin:$PATH"  # for GPU
export PATH="$PATH:$HOME/.rvm/bin"  # for Ruby
export PATH="$HOME/.cargo/bin:$PATH"  # for Rust

# Enable zsh auto-completion
autoload -Uz compinit && compinit

# Add CUDA stuff to PATH
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias docker-cleanup='docker rm -v $(docker ps -a -q -f status=exited); docker rmi $(docker images -f "dangling=true" -q)'
alias doco="docker-compose"
alias ls="ls -GFlsh"
alias vim="nvim"
alias vimdiff="nvim -d"

# Run tmux automatically at shell startup
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

# configure node version manager (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# configure pyenv (python version manager)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
