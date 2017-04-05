" カラー関連 color

" 構文毎に文字色を変化させる
syntax enable

" カラースキーマの指定
" colorscheme elflord
" colorscheme iceberg
" colorscheme hybrid_material
colorscheme Tomorrow-Night-Eighties

" 行番号の色
" highlight LineNr ctermfg=darkyellow
highlight LineNr ctermfg=190

augroup myStatusLine
  autocmd! ColorScheme * highlight StatusLine guibg=White guifg=Black
  autocmd! ColorScheme * highlight StatusLineNC guibg=Gray guifg=Black
augroup END
