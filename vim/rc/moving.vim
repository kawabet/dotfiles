"-------------------------------------------------------------------------------
" 移動設定 Move
"-------------------------------------------------------------------------------

" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk

" 0, 9で行頭、行末へ
nmap <C-a> ^
" nmap 0 ^
nmap <C-e> $
" insert mode での移動
inoremap  <C-e> <END>
inoremap  <C-a> <HOME>
" インサートモードでもhjklで移動（Ctrl押すけどね）
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
