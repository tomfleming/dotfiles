# load prezto + plugins
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"


# switch default editor to vim
export EDITOR='vim'
export VISUAL='vim'


# if zsh ever starts loading slowly again... try zprof
# zmodload zsh/zprof


# enable pure prompt
autoload -U promptinit; promptinit
prompt pure


# configure PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/Library/TeX/texbin"
export PATH="$CUDA_HOME/bin:$PATH"  # for GPU
export PATH="$HOME/.cargo/bin:$PATH"  # for Rust
export PATH="$HOME/apache-maven-3.6.0/bin:$PATH"  # for maven
export PATH="$HOME/.jenv/bin:$PATH"  # for java version management


# enable zsh auto-completion
autoload -Uz compinit && compinit
eval "$(pipenv --completion)"


# configure CUDA
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"


# set personal aliases
alias docker-cleanup='docker rm -v $(docker ps -a -q -f status=exited); docker rmi $(docker images -f "dangling=true" -q)'
alias doco="docker-compose"
alias ll="ls -GFlsh"
alias la="ls -GFlash"
alias vim="nvim"
alias vimdiff="nvim -d"
alias cd-gitr='cd $(git rev-parse --show-toplevel)'


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
alias vimff='vim $(fzf)'


# load pyenv (python version manager)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# load rbenv to manage ruby versions
eval "$(rbenv init -)"


# load nodenv to manage node versions
eval "$(nodenv init -)"


# load nodenv to manage node versions
eval "$(jenv init -)"


# import non-shared aliases
. $HOME/.zcustomaliases


# if zsh ever starts loading slowly again... try zprof
# zprof
