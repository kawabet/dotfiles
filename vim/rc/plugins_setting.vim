" プラグイン毎の設定 plugins

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

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
" rubocop
" JavaScriptも
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['ruby', 'javascript'],
    \ 'passive_filetypes': [], }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_javascript_checker = "jshint"
let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"
" 上記はデフォルト。上書きしたい場合に設定。

" --------------------------------
" emmet関連
" --------------------------------
let g:user_emmet_mode = 'iv'
  let g:user_emmet_leader_key = '<C-Y>'
  let g:use_emmet_complete_tag = 1
  let g:user_emmet_settings = {
        \ 'lang' : 'ja',
        \ 'html' : {
        \   'filters' : 'html',
        \ },
        \ 'css' : {
        \   'filters' : 'fc',
        \ },
        \ 'php' : {
        \   'extends' : 'html',
        \   'filters' : 'html',
        \ },
        \}
augroup EmmitVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = '               '[:&tabstop]
augroup END

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
"[VimのUniteプラグインでファイル、バッファ、ブックマーク管理 \| karakaram\-blog](http://www.karakaram.com/unite#operation)
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50

" バッファ一覧
nnoremap <silent> <space>ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> <space>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> <space>ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> <space>um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> <space>uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> <space>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"ブックマーク一覧
nnoremap <silent> <space>uo :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> <space>ui :<C-u>UniteBookmarkAdd<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" .mdファイルにMarkdownのハイライトを適用
au BufRead,BufNewFile *.md set filetype=markdown

""""""""""""""""""""""""""""""
" fugitive.vim
""""""""""""""""""""""""""""""
" [dotfiles/\.vimrc\.plugins\_setting at 350f509530411d92ea77363ca8efb1745c2ab063 · yuroyoro/dotfiles](https://github.com/yuroyoro/dotfiles/blob/350f509530411d92ea77363ca8efb1745c2ab063/.vimrc.plugins_setting)
nnoremap <silent> <space>gd :<C-u>Gdiff<Enter>
nnoremap <silent> <space>gs :<C-u>Gstatus<Enter>
nnoremap <silent> <space>gl :<C-u>Glog<Enter>
nnoremap <silent> <space>ga :<C-u>Gwrite<Enter>
nnoremap <silent> <space>gc :<C-u>Gcommit<Enter>
nnoremap <silent> <space>gC :<C-u>Git commit --amend<Enter>
nnoremap <silent> <space>gb :<C-u>Gblame<Enter>

" [脱初心者を目指すVimmerにオススメしたいVimプラグインや\.vimrcの設定 \- Qiita](http://qiita.com/jnchito/items/5141b3b01bced9f7f48f)
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}


""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""
" [fatih/vim\-go: Go development plugin for Vim](https://github.com/fatih/vim-go)
" 実行
au FileType go nmap <leader>r <Plug>(go-run)
" ビルド
au FileType go nmap <leader>b <Plug>(go-build)
" テスト実行
au FileType go nmap <leader>t <Plug>(go-test)
" カバレッジ
au FileType go nmap <leader>c <Plug>(go-coverage)

" ウィンドウを横に分割してgodef
au FileType go nmap <leader>ds <Plug>(go-def-split)
" ウィンドウを縦に分割してgodef
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
" 新規タブでgodef
au FileType go nmap <leader>dt <Plug>(go-def-tab)
" godocを開く
au FileType go nmap <leader>gd <Plug>(go-doc)
" ウィンドウを縦に分割してgodoc
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
" ブラウザでgodocを開く
au FileType go nmap <leader>gb <Plug>(go-doc-browser)

" interfaceの実装のリストを開く
au FileType go nmap <leader>s <Plug>(go-implements)
" 型情報を表示
au FileType go nmap <leader>i <Plug>(go-info)
" カーソル下をリネーム
au FileType go nmap <leader>e <Plug>(go-rename)

