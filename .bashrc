# ctags="`brew --prefix`/bin/ctags"

# # [pecoの基礎の基礎 \- Qiita](http://qiita.com/xtetsuji/items/05f6f4c1b17854cdd75b)
# function peco-lscd {
#     local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
#     if [ ! -z "$dir" ] ; then
#         cd "$dir"
#     fi
# }
# alias pcd=peco-lscd

# # [ghq, peco, hubで快適Gitライフを手に入れよう！ \- Qiita](http://qiita.com/itkrt2y/items/0671d1f48e66f21241e2)
# alias gcd='cd $(ghq list --full-path | peco)'

# # [bashのキーバインドを変えて快適ターミナルライフ \- Qiita](http://qiita.com/yamamoto_hiroya/items/2f5c549c2da25cb9eb78)
# # ctrl+fで次の単語に移動
# bind '"\C-f": forward-word'
# # ctrl+bで前の単語に移動
# bind '"\C-b": backward-word'

# # alias
# if [ "$(uname)" = 'Darwin' ]; then
#     export LSCOLORS=xbfxcxdxbxegedabagacad
#     alias ls='ls -G'
#     alias ll='ls -lG'
#     alias la='ls -alG'
# else
#     # eval `dircolors ~/.colorrc`
#     alias ls='ls --color=auto'
#     alias ll='ls -l --color=auto'
#     alias la='ls -al --color=auto'
# fi


# # [Mac で bash でも peco\-history を使いたい \- Qiita](http://qiita.com/yungsang/items/09890a06d204bf398eea)
# export HISTCONTROL="ignoredups"
# peco-history() {
#   local NUM=$(history | wc -l)
#   local FIRST=$((-1*(NUM-1)))

#   if [ $FIRST -eq 0 ] ; then
#     # Remove the last entry, "peco-history"
#     history -d $((HISTCMD-1))
#     echo "No history" >&2
#     return
#   fi

#   local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

#   if [ -n "$CMD" ] ; then
#     # Replace the last entry, "peco-history", with $CMD
#     history -s $CMD

#     if type osascript > /dev/null 2>&1 ; then
#       # Send UP keystroke to console
#       (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
#     fi

#     # Uncomment below to execute it here directly
#     # echo $CMD >&2
#     # eval $CMD
#   else
#     # Remove the last entry, "peco-history"
#     history -d $((HISTCMD-1))
#   fi
# }
# bind '"\C-r":"peco-history\n"'

# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
