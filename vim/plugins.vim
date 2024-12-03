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
" Layout, Visual Colours and Style
Plugin 'arzg/vim-colors-xcode' "Highly Recommend
Plugin 'preservim/nerdtree'
Plugin 'sainnhe/everforest'
Plugin 'sainnhe/edge'
Plugin 'pseewald/vim-anyfold'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'

" Syntax Highlighting and Additional Language Support
Plugin 'LucHermitte/lh-cpp'    " C/C++ general purpose
Plugin 'pulkomandy/c.vim'
Plugin 'keith/swift.vim'
Plugin 'arnoudbuzing/wolfram-vim'
Plugin 'vim-scripts/applescript.vim'
Plugin 'lervag/vimtex'          " Latex
Plugin 'aclements/latexrun'
Plugin 'jvirtanen/vim-octave'
Plugin 'preservim/vim-markdown' 
Plugin 'stsewd/gx-extended.vim'
" Plugin 'tpope/vim-markdown'   
" Plugin 'jtratner/vim-flavored-markdown'



if has("win32")
    " Windows Options
    Plugin 'pprovost/vim-ps1'
else
    if has("unix")
        if has("macunix")
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
 
        Plugin 'sirver/ultisnips'
"         Plugin 'honza/vim-snippets'
        endif
    endif
endif









""""""""" End of Plugins
call vundle#end()
filetype plugin indent on

