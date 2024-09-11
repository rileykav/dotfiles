set nocompatible


set nocompatible           " Be improved, required
filetype off                " Required

" set runtime path to include Vundle and initialise
set shellslash
set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
call vundle#begin('~/.dotfiles/vim/bundle/')


"""""""" Required Plugins
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
""""""""" User Plugins
Plugin 'lervag/vimtex'
""""""""" End of Plugins
call vundle#end()
filetype plugin indent on


syntax enable

let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'texworks.exe'
let g:vimtex_compiler_latexmk = {
    \ 'callback' : 0,
    \ 'continuous' : 0,
    \}
