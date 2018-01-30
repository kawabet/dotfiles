# .zprofile

# Get the aliases and functions
if [ -f ~/.zshrc ]; then
	. ~/.zshrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
export PATH="/usr/local/bin:$PATH"
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
export GOROOT=/usr/local/Cellar/go/1.9.2/libexec
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

# [zshを使ってみる \- Qiita](https://qiita.com/ryutoyasugi/items/cb895814d4149ca44f12)
# ヒストリの設定
HISTFILE=~/.zsh_history
# メモリに保存される履歴の件数
HISTSIZE=10000
# 履歴ファイルに保存される履歴の件数
SAVEHIST=10000
# 直前のコマンドの重複を削除
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# 同時に起動したzshの間でヒストリを共有
setopt share_history
# 開始と終了を記録
setopt EXTENDED_HISTORY
# スペースで始まるコマンド行はヒストリリストから削除
# setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
# setopt hist_verify
# 余分な空白は詰めて記録
# setopt hist_reduce_blanks
# historyコマンドは履歴に登録しない
# setopt hist_no_store
# 補完時にヒストリを自動的に展開
# setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history
# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# 補完機能を有効にする
autoload -Uz compinit
compinit -u
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を詰めて表示
setopt list_packed
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

# prompt
# autoload -Uz vcs_info
# setopt prompt_subst
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
# zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
# zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
# zstyle ':vcs_info:*' actionformats '[%b|%a]'
# precmd() { vcs_info }
# PROMPT='%m:%F{green}%~%f %n %F{yellow}$%f '
# RPROMPT='${vcs_info_msg_0_}'


# [Terminal: zshプロンプトのカスタマイズ（git対応） \| siro:chro](http://www.sirochro.com/note/terminal-zsh-prompt-customize/)
# VCSの情報を取得するzsh関数
autoload -Uz vcs_info
autoload -Uz colors # black red green yellow blue magenta cyan white
colors

# PROMPT変数内で変数参照
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

# %b ブランチ情報
# %a アクション名(mergeなど)
# %c changes
# %u uncommit

# プロンプト表示直前に vcs_info 呼び出し
precmd () { vcs_info }

# プロンプト（左）
PROMPT='%{$fg[red]%}[%n@%m]%{$reset_color%}'
PROMPT=$PROMPT'${vcs_info_msg_0_} %{${fg[red]}%}%}$%{${reset_color}%} '

# プロンプト（右）
RPROMPT='%{${fg[red]}%}[%~]%{${reset_color}%}'



