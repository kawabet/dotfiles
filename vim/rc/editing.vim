" 編集関連 editing

" [dotfiles/\.vimrc\.editing at master · yuroyoro/dotfiles](https://github.com/yuroyoro/dotfiles/blob/master/.vimrc.editing)
" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" y9 ydで行末までヤンク
nmap y9 y$
nmap yd y$
" y0 ykで行頭までヤンク
nmap y0 y^
nmap yk y^

" カーソルから行頭まで削除(インサートモード)
" inoremap <silent> <C-k> <Esc>lc^
" カーソルから行末まで削除(インサートモード)
" inoremap <silent> <C-k> <Esc>lc$
" カーソルから行頭までヤンク(インサートモード)
" inoremap <silent> <C-y>0 <Esc>ly0<Insert>
" カーソルから行末までヤンク(インサートモード)
" inoremap <silent> <C-y>e <Esc>ly$<Insert>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
" autocmd BufWritePre * :%s/\t/  /ge

" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" quickfixウィンドウではq/ESCで閉じる
autocmd FileType qf nnoremap <buffer> q :ccl<CR>
autocmd FileType qf nnoremap <buffer> <ESC> :ccl<CR>

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" クリップボードからコピー
""""""""""""""""""""""""""""""
if has("gui_running")
  map <silent> <S-Insert> "+p
  cmap <S-Insert> <C-R>+
  imap <silent> <S-Insert> <Esc>"+pa
endif

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
" cohama/lexima.vim に変更
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
""""""""""""""""""""""""""""""


" clipboard for wsl2
if system('uname -a | grep microsoft') != ""
  let g:clipboard = {
    \  'name': 'wslClipboard',
    \   'copy': {
    \      '+': 'win32yank.exe -i',
    \      '*': 'win32yank.exe -i',
    \   },
    \  'paste': {
    \      '+': 'win32yank.exe -o',
    \      '*': 'win32yank.exe -o',
    \   },
    \   'cache_enabled': 1
    \ }
endif
