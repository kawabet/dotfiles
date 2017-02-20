# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### for nodejs
if [[ -s ~/.nvm/nvm.sh ]];
   then source ~/.nvm/nvm.sh
fi
export PATH=$HOME/.nodebrew/current/bin:$PATH

### GOPATH
export GOPATH=$HOME/dev
export GOROOT=/usr/local/Cellar/go/1.8/libexec
export PATH=$GOPATH/bin:$PATH

### Python version management: pyenv.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### brew-file
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

### neovim
export XDG_CONFIG_HOME="$HOME/.config"
export TERM=xterm-256color
