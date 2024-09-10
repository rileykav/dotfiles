




set termguicolors
set t_Co=256

colorscheme xcodedark


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










" Set Default shell to Powershell
:set shell=pwsh " See `:set shell=powershell shellcmdflag=-c shellquote=\" shellxquote=` and the formum https://stackoverflow.com/questions/63607183/open-a-terminal-in-vim-and-execute-a-command-inside-this-terminal-on-windows 




