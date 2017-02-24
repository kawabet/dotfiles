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

" ウィンドウ操作
"[Vimの便利な画面分割＆タブページと、それを更に便利にする方法 \- Qiita](http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca)
nnoremap s <Nop>
" ウィンドウの移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" ウィンドウの入れ替え
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
" タブの移動
nnoremap sn gt
nnoremap sp gT
" 回転
nnoremap sr <C-w>r
" 大きさを揃える
nnoremap s= <C-w>=
" 次に移動
nnoremap sw <C-w>w
" 縦横最大化
nnoremap so <C-w>_<C-w>|
" 大きさを揃える
nnoremap sO <C-w>=
" 次のバッファに移動
nnoremap sN :<C-u>bn<CR>
" 前のバッファに移動
nnoremap sP :<C-u>bp<CR>
" 新規タブ
nnoremap st :<C-u>tabnew<CR>
" タブ一覧
nnoremap sT :<C-u>Unite tab<CR>
" 横分割
nnoremap ss :<C-u>sp<CR>
" 縦分割
nnoremap sv :<C-u>vs<CR>
" ウィンドウを閉じる
nnoremap sq :<C-u>q<CR>
" タブを閉じる
nnoremap sQ :<C-u>bd<CR>
" 現在のタブで開いたバッファ一覧
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>

" 幅を増やす
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
" 幅を減らす
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
" 高さを増やす
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
" 高さを減らす
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

