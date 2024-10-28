syntax enable
fun! SetMyTodos()
    syn match myTodos /\%(NOTE:\)/
    hi link myTodos Todo
endfun
autocmd bufenter * :call SetMyTodos()
autocmd filetype * :call SetMyTodos()


" set termguicolors
" let &t_Ts = "\e[9m"
" let &t_Te = "\e[29m"
hi myTodos gui=bold ctermfg=green

