#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

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
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
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

alias brew="env PATH=${PATH/~\/\.pyenv\/shims:/} brew"

alias dcc='docker-compose'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# https://ktaka.hatenablog.com/entry/2018/11/11/001635
export PATH="/usr/local/opt/libpq/bin:$PATH"

# open-ssl
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export PATH="/usr/local/opt/openssl@1.1/bin/openssl:$PATH"

# anyenv
eval "$(anyenv init -)"
