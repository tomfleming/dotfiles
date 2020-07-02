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
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"  # for VS Code
export PATH="$PATH:$HOME/.poetry/bin"  # for python poetry
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"  # for Yarn
export PATH="$PATH:$HOME/.composer/vendor/bin"  # for PHP


# enable pipenv auto-completion
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
fz() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && nvim "${files[@]}"
}

fzr() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  local files
  IFS=$'\n' files=($(rg -S --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"))
  [[ -n "$files" ]] && nvim "${files[@]}"
}


# load pyenv (python version manager)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# enable pipenv auto-completion
eval "$(pipenv --completion)"


# load rbenv to manage ruby versions
eval "$(rbenv init -)"


# load nodenv to manage node versions
eval "$(nodenv init -)"


# load nodenv to manage node versions
eval "$(jenv init -)"

# hacky fix for python multi-processing: https://stackoverflow.com/questions/50168647/multiprocessing-causes-python-to-crash-and-gives-an-error-may-have-been-in-progr
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# The next line updates PATH for the Google Cloud SDK.
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
export CLOUDSDK_PYTHON=$(which python)

# Enable poetry autocompletion
fpath+=~/.zfunc

# fix strange mysql autocompletion behavior
unalias mysql

# include LDFLAGS and CPPFLAGS for fixing openssl and installing mysqlclient
# https://medium.com/@shandou/pipenv-install-mysqlclient-on-macosx-7c253b0112f2
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# import non-shared aliases
. $HOME/.zcustomaliases

# if zsh ever starts loading slowly again... try zprof
# zprof
