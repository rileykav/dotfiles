




set termguicolors
" let &t_Ts = "\e[2m"
" let &t_Te = "\e[29m"
au BufRead *md hi mkdCode ctermfg=2 
" hi mkdCode cterm=strikethrough
" finish
set t_Co=256
" colorscheme xcodedark
colorscheme edge


" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
" normal mode
let &t_EI .= "\<Esc>[2 q"
" insert mode
let &t_SI .= "\<Esc>[5 q"



au BufWinLeave ~/todo.md !cp ~/todo.md ~/iCloudDrive/Documents/todo.md
au BufWinLeave ~/iCloudDrive/Documents/todo.md !cp ~/iCloudDrive/Documents/todo.md ~/todo.md


autocmd BufRead,BufNewFile *md syn match parens /[(){}]/ | hi parens ctermfg=red
autocmd BufRead,BufNewFile *md command Test echo "test"


function! HighlightDoubleAngleBrackets() abort
    syn match strayClosingDoubleAngleBracket "\]"
    syn region textWithinDoubleAngleBracketPair matchgroup=doubleAngleBracketPair start="\[" end="\]"
    hi link strayClosingDoubleAngleBracket Error
    hi link doubleAngleBracketPair Delimiter
endfunction

autocmd BufNewFile,BufRead *.md call HighlightDoubleAngleBrackets()



" Set Default shell to Powershell
set shell=pwsh 
" See `:set shell=powershell shellcmdflag=-c shellquote=\" shellxquote=` and the formum https://stackoverflow.com/questions/63607184/open-a-terminal-in-vim-and-execute-a-command-inside-this-terminal-on-windows 




