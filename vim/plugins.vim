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
Plugin 'preservim/nerdtree'
Plugin 'lervag/vimtex'
Plugin 'arzg/vim-colors-xcode' "Highly Recommend
Plugin 'sainnhe/everforest'
Plugin 'pseewald/vim-anyfold'
Plugin 'aclements/latexrun'
Plugin 'jvirtanen/vim-octave'
Plugin 'LucHermitte/lh-cpp'    " C/C++ general purpose
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'pulkomandy/c.vim'
Plugin 'keith/swift.vim'
Plugin 'arnoudbuzing/wolfram-vim'
Plugin 'preservim/vim-markdown'
Plugin 'vim-scripts/applescript.vim'

if has("win32")
    " Windows Options
else
    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
        " Mac options here
"         Plugin 'ycm-core/YouCompleteMe' 
"         Plugin 'tpope/vim-fugitive'
"         Plugin 'vim-syntastic/syntastic'	" Was getting error, try again?
"         Plugin 'neoclide/coc.nvim'
"         Plugin 'vim-latex/vim-latex'
        Plugin 'ctrlpvim/ctrlp.vim' "Breaking on Windows?
        Plugin 'ajh17/VimCompletesMe' 		" Sign in to git failing
        Plugin 'preservim/vimux' " Requires Tmux
        Plugin 'christoomey/vim-tmux-navigator'
        Plugin 'christoomey/vim-tmux-runner'
 
 
        Plugin 'SirVer/ultisnips'
"         Plugin 'honza/vim-snippets'
        endif
    endif
endif









""""""""" End of Plugins
call vundle#end()
filetype plugin indent on

