#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
export PATH="/usr/local/bin:$PATH"
# for wsl2
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

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
# GOROOTはいらない
# export GOROOT=/usr/local/Cellar/go/1.9.2/libexec
export PATH=$GOPATH/bin:$PATH
### go-buffalo
export BUFFALO_PLUGIN_PATH=$PATH

### Python version management: pyenv.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

### Python virtual environment wrapper
# export WORKON_HOME="$HOME/.virtualenvs"
# source $PYENV_ROOT/shims/virtualenvwrapper.sh

### pipenv
export PIPENV_VENV_IN_PROJECT=true

### brew-file
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

### neovim
export XDG_CONFIG_HOME="$HOME/.config"
export TERM=xterm-256color

# [github/hub: hub helps you win at git\.](https://github.com/github/hub)
eval "$(hub alias -s)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/workspace/google-cloud-sdk/path.zsh.inc ]; then
  source ~/workspace/google-cloud-sdk/path.zsh.inc
fi

# The next line enables shell command completion for gcloud.
if [ -f ~/workspace/google-cloud-sdk/completion.zsh.inc ]; then
  source ~/workspace/google-cloud-sdk/completion.zsh.inc
fi

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi


# java
# for Mac
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
# for wsl2
# export JAVA_HOME=`/usr/lib/jvm/java-11-openjdk-amd64/bin/java`
export JAVA_HOME=`/usr/bin/java`
export PATH=${JAVA_HOME}/bin:$PATH


# Typescript
export TS_POST_PROCESS_FILE="/usr/local/bin/prettier --write"
