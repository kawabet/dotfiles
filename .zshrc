#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

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
