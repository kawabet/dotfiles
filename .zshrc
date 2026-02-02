#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export PATH="/opt/homebrew/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
if [ -e "/opt/homebrew/bin/anyenv" ]; then
  eval "$(anyenv init -)"
fi


# https://zenn.dev/ress/articles/069baf1c305523dfca3d
typeset -U path PATH
path=(
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	$path
)

### Python version management: pyenv.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"


if (( $+commands[sw_vers] )) && (( $+commands[arch] )); then
	[[ -x /usr/local/bin/brew ]] && alias brew="arch -arch x86_64 /usr/local/bin/brew"
	alias x64='exec arch -x86_64 /bin/zsh'
	alias a64='exec arch -arm64e /bin/zsh'
	switch-arch() {
		if  [[ "$(uname -m)" == arm64 ]]; then
			arch=x86_64
		elif [[ "$(uname -m)" == x86_64 ]]; then
			arch=arm64e
		fi
		exec arch -arch $arch /bin/zsh
	}
fi

setopt magic_equal_subst

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# [peco$B$N4pAC$N4pAC(B \- Qiita](http://qiita.com/xtetsuji/items/05f6f4c1b17854cdd75b)
function peco-lscd {
    local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}
alias pcd=peco-lscd

# [【Mac】ターミナル設定（iTerm2 \+ zsh \+ prezto \+ peco） \| Nonsense J](https://nonsensej.xyz/articles/wp/259)
function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection


# [ghq, peco, hub$B$G2wE,(BGit$B%i%$%U$r<j$KF~$l$h$&!*(B \- Qiita](http://qiita.com/itkrt2y/items/0671d1f48e66f21241e2)
alias gcd='cd $(ghq list --full-path | peco)'


# buffalo
alias b='buffalo'

# python
alias py='python'

# alias brew="env PATH=${PATH/~\/\.pyenv\/shims:/} brew"

alias dcc='docker compose'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"


# mysql
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/mysql-client@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql-client@8.0/include"
# export DYLD_LIBRARY_PATH=/opt/homebrew/opt/mysql@8.0/lib/:$DYLD_LIBRARY_PATH

export DYLD_LIBRARY_PATH=/opt/homebrew/lib:$DYLD_LIBRARY_PATH


# open-ssl
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export PATH="/usr/local/opt/openssl@1.1/bin/openssl:$PATH"

# anyenv
if [[ -d "$HOME/.anyenv" ]]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  # パスが設定された後にanyenvを初期化
  eval "$(anyenv init -)"
fi


# gdal
export GDAL_LIBRARY_PATH=/opt/homebrew/lib/libgdal.dylib

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kawabet/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

export PATH="/opt/homebrew/sbin:$PATH"


source /Users/kawabet/.docker/init-zsh.sh || true # Added by Docker Desktop

# Added by Antigravity
export PATH="/Users/kawabet/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/kawabet/.antigravity/antigravity/bin:$PATH"
