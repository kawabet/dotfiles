# # .bash_profile

# # Get the aliases and functions
# if [ -f ~/.bashrc ]; then
# 	. ~/.bashrc
# fi

# # User specific environment and startup programs

# PATH=$PATH:$HOME/bin

# export PATH
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# ### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

# ### for nodejs
# if [[ -s ~/.nvm/nvm.sh ]];
#    then source ~/.nvm/nvm.sh
# fi
# export PATH=$HOME/.nodebrew/current/bin:$PATH

# ### GOPATH
# export GOPATH=$HOME/dev
# export GOROOT=/usr/local/Cellar/go/1.9.2/libexec
# export PATH=$GOPATH/bin:$PATH

# ### Python version management: pyenv.
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# ### brew-file
# if [ -f $(brew --prefix)/etc/brew-wrap ];then
#   source $(brew --prefix)/etc/brew-wrap
# fi

# ### neovim
# export XDG_CONFIG_HOME="$HOME/.config"
# export TERM=xterm-256color

# # [github/hub: hub helps you win at git\.](https://github.com/github/hub)
# eval "$(hub alias -s)"

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f ~/workspace/google-cloud-sdk/path.bash.inc ]; then
#   source ~/workspace/google-cloud-sdk/path.bash.inc
# fi

# # The next line enables shell command completion for gcloud.
# if [ -f ~/workspace/google-cloud-sdk/completion.bash.inc ]; then
#   source ~/workspace/google-cloud-sdk/completion.bash.inc
# fi

# # flutter
# export PATH=$PATH:$HOME/flutter/bin


# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kawabet/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kawabet/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kawabet/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kawabet/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


source /Users/kawabet/.docker/init-bash.sh || true # Added by Docker Desktop
