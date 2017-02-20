""""""""""""""""""""""""""""""
" 基本設定 basic
""""""""""""""""""""""""""""""

" キーマップリーダー
let mapleader = ","
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8
" 想定される改行コードの指定する
set fileformats=unix,dos,mac
" タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" バックアップとらない
set nobackup
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" 一行に長い文章を書いていても自動折り返しをしない
set textwidth=0
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" バックスペースでなんでも消せるように
set backspace=indent,eol,start
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" ビープを鳴らさない
set vb t_vb= 

" OSのクリップボードを使用する
set clipboard+=unnamed
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a

"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed
" 挿入モードでCtrl+pを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-p>  <ESC>"*pa

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow


