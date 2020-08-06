" カラー関連 color

" 構文毎に文字色を変化させる
syntax enable


" カラースキーマの指定
" colorscheme elflord
" colorscheme iceberg
" colorscheme hybrid_material
" colorscheme hybrid_reverse
" colorscheme Tomorrow-Night-Eighties
" colorscheme luna-term

colorscheme desert
" colorscheme base

" コメントを濃い緑にする
" highlight Comment ctermfg=114 guifg=palegreen3

" タブ文字の色を変更
augroup set-tab-highlight
  autocmd!
  autocmd VimEnter,Colorscheme * highlight SpecialKey cterm=NONE ctermfg=244 ctermbg=NONE
  autocmd VimEnter,Colorscheme * highlight Whitespace cterm=NONE ctermfg=244 ctermbg=NONE
augroup END

if has('gui_running')
  " colorscheme luna
endif


" 行番号の色
" highlight LineNr ctermfg=darkyellow
" highlight LineNr ctermfg=190

" 背景色を黒にする
" highlight Normal guibg=Black guifg=White

" augroup myStatusLine
"   autocmd! ColorScheme * highlight StatusLine guibg=White guifg=Black
"   autocmd! ColorScheme * highlight StatusLineNC guibg=Gray guifg=Black
" augroup END


" [Vim のカラースキームが微妙に気に食わないときの対処法 \- 反省はしても後悔はしない](http://cohama.hateblo.jp/entry/2013/08/11/020849)
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
