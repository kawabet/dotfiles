" プラグイン毎の設定 plugins

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" Syntastic
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['ruby', 'javascript'],
    \ 'passive_filetypes': [], }
" Ruby
let g:syntastic_ruby_checkers = ['rubocop']
" JavaScript
let g:syntastic_javascript_checkers = ["eslint"]
" エラーにsignを表示
let g:syntastic_enable_signs=1
" location listを自動的に表示しない
let g:syntastic_auto_loc_list=2
" 常にチェック結果をlocation listに反映させる
let g:syntastic_always_populate_loc_list = 1
" ファイルを開いた時にチェックを実行する
let g:syntastic_check_on_open = 1
" :wq で終了する時はチェックしない
let g:syntastic_check_on_wq = 0

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
"[VimのUniteプラグインでファイル、バッファ、ブックマーク管理 \| karakaram\-blog](http://www.karakaram.com/unite#operation)
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 20

noremap [unite] <nop>
map <space>u [unite]
" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=files buffer_tab file file_mru<CR>
" 全部乗せ
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
" ブックマーク一覧
nnoremap <silent> [unite]o :<C-u>Unite bookmark<CR>
" ブックマークに追加
nnoremap <silent> [unite]i :<C-u>UniteBookmarkAdd<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" [agとUnite\.vimで快適高速grep環境を手に入れる · THINKING MEGANE](http://blog.monochromegane.com/blog/2013/09/18/ag-and-unite/)
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" grep検索
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> [unite]s :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果の再呼出
nnoremap <silent> [unite]v :<C-u>UniteResume search-buffer<CR>

" Uniteで色を見ながら選択
nnoremap <silent> [unite]c :<C-u>Unite webcolorname<CR>

" スニペットを表示
nnoremap <silent> [unite]q :<C-u>Unite neosnippet<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif


" .mdファイルにMarkdownのハイライトを適用
au BufRead,BufNewFile *.md set filetype=markdown

""""""""""""""""""""""""""""""
" fugitive.vim
""""""""""""""""""""""""""""""
" [dotfiles/\.vimrc\.plugins\_setting at 350f509530411d92ea77363ca8efb1745c2ab063 · yuroyoro/dotfiles](https://github.com/yuroyoro/dotfiles/blob/350f509530411d92ea77363ca8efb1745c2ab063/.vimrc.plugins_setting)
noremap [fugitive] <nop>
map <space>g [fugitive]
nnoremap <silent> [fugitive]d :<C-u>Gdiff<Enter>
nnoremap <silent> [fugitive]s :<C-u>Gstatus<Enter>
nnoremap <silent> [fugitive]l :<C-u>Glog<Enter>
nnoremap <silent> [fugitive]a :<C-u>Gwrite<Enter>
nnoremap <silent> [fugitive]c :<C-u>Gcommit<Enter>
nnoremap <silent> [fugitive]C :<C-u>Git commit --amend<Enter>
nnoremap <silent> [fugitive]b :<C-u>Gblame<Enter>

" [脱初心者を目指すVimmerにオススメしたいVimプラグインや\.vimrcの設定 \- Qiita](http://qiita.com/jnchito/items/5141b3b01bced9f7f48f)
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

""""""""""""""""""""""""""""""
" vim-gitgutter
""""""""""""""""""""""""""""""
" vim-gitgutterのハイライトを切り替え
nnoremap <silent> [fugitive]t :<C-u>GitGutterLineHighlightsToggle<Enter>
nmap <C-n> <Plug>GitGutterNextHunk
nmap <C-m> <Plug>GitGutterPrevHunk


""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""
" [fatih/vim\-go: Go development plugin for Vim](https://github.com/fatih/vim-go)
" Settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_auto_type_info = 1

" Shortcut
" 実行
au FileType go nmap <leader>r <Plug>(go-run)
" ビルド
au FileType go nmap <leader>b <Plug>(go-build)
" テスト実行
au FileType go nmap <leader>t <Plug>(go-test)
" カバレッジ
au FileType go nmap <leader>c <Plug>(go-coverage)

" そのままgodef C-]と同じ
au FileType go nmap <leader>def <Plug>(go-def)
" ウィンドウを横に分割してgodef
au FileType go nmap <leader>defs <Plug>(go-def-split)
" ウィンドウを縦に分割してgodef
au FileType go nmap <leader>defv <Plug>(go-def-vertical)
" 新規タブでgodef
au FileType go nmap <leader>deft <Plug>(go-def-tab)

" godocを開く
au FileType go nmap <leader>doc <Plug>(go-doc)
" ウィンドウを横に分割してgodoc
au FileType go nmap <leader>docs <Plug>(go-doc-split)
" ウィンドウを縦に分割してgodoc
au FileType go nmap <leader>docv <Plug>(go-doc-vertical)
" ブラウザでgodocを開く
au FileType go nmap <leader>docb <Plug>(go-doc-browser)

" interfaceの実装のリストを開く
au FileType go nmap <leader>imp <Plug>(go-implements)
" 型情報を表示
au FileType go nmap <leader>i <Plug>(go-info)
" カーソル下をリネーム
au FileType go nmap <leader>rename <Plug>(go-rename)

" testファイルにジャンプ
au FileType go nmap <leader>a <Plug>(go-alternate-edit)
" testファイルを開く（ウィンドウ横分割）
au FileType go nmap <leader>as <Plug>(go-alternate-split)
" testファイルを開く（ウィンドウ縦分割）
au FileType go nmap <leader>av <Plug>(go-alternate-vertical)

" 関数リストを開く(現在のファイル)
au FileType go nmap <leader>ls :<C-u>GoDecls<Enter>
" 関数リストを開く(現在のディレクトリ)
au FileType go nmap <leader>lsd :<C-u>GoDeclsDir<Enter>
