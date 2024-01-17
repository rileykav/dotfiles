set nocompatible           " Be improved, required
filetype off                " Required

" set runtime path to include Vundle and initialise
set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
call vundle#begin('~/.dotfiles/vim/bundle/')


"""""""" Required Plugins
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
""""""""" User Plugins

" Plugin 'ycm-core/YouCompleteMe' 
Plugin 'preservim/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'tpope/vim-fugitive'
"Plugin 'vim-syntastic/syntastic'	" Was getting error, try again?
Plugin 'ajh17/VimCompletesMe'
"Plugin 'neoclide/coc.nvim'
"Plugin 'vim-latex/vim-latex'
Plugin 'lervag/vimtex'
Plugin 'preservim/vimux'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'pulkomandy/c.vim'
" Colourshemes
Plugin 'arzg/vim-colors-xcode' "Highly Reccomend
Plugin 'sainnhe/everforest'
Plugin 'pseewald/vim-anyfold'
Plugin 'aclements/latexrun'
Plugin 'jvirtanen/vim-octave'
Plugin 'LucHermitte/lh-cpp'    " C/C++ general purpose
Plugin 'SirVer/ultisnips'
"Plugin 'sirver/UltiSnips'
"Plugin 'honza/vim-snippets'
Plugin 'keith/swift.vim'
Plugin 'arnoudbuzing/wolfram-vim'
Plugin 'preservim/vim-markdown'
""""""""" End of Plugins
call vundle#end()
filetype plugin indent on

