ctags="`brew --prefix`/bin/ctags"

# [pecoの基礎の基礎 \- Qiita](http://qiita.com/xtetsuji/items/05f6f4c1b17854cdd75b)
function peco-lscd {
    local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}
alias pcd=peco-lscd

# [ghq, peco, hubで快適Gitライフを手に入れよう！ \- Qiita](http://qiita.com/itkrt2y/items/0671d1f48e66f21241e2)
alias gcd='cd $(ghq list --full-path | peco)'

# [bashのキーバインドを変えて快適ターミナルライフ \- Qiita](http://qiita.com/yamamoto_hiroya/items/2f5c549c2da25cb9eb78)
# ctrl+fで次の単語に移動
bind '"\C-f": forward-word'
# ctrl+bで前の単語に移動
bind '"\C-b": backward-word'

# alias
alias ll='ls -al'
