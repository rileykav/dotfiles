""""""""""""""""""""""""""""""""""""""""""""""
" Python Section
""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType python nnoremap <leader>; mmgI#<esc>`mh 
au FileType python nnoremap <leader>' mmgI<esc>x`mh 

" Adds python boilerplate
autocmd BufNewFile *.py 0r /Users/riley/.dotfiles/vim/boilerplate/python/riley_base.py
""""""""""""""""""""""""""""""""""""""""""""""
" C Section
""""""""""""""""""""""""""""""""""""""""""""""
au FileType c  nnoremap <leader>; mmgI//<esc>`mh 
au FileType c  nnoremap <leader>' mmgI<esc>xx`mh 



""""""""""""""""""""""""""""""""""""""""""""""
" Javascript Section
""""""""""""""""""""""""""""""""""""""""""""""

au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <C-t> $log();<esc>hi
au FileType javascript imap <C-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

""""""""""""""""""""""""""""""""""""""""""""""
" CoffeeScript Seciotn
""""""""""""""""""""""""""""""""""""""""""""""

function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])

""""""""""""""""""""""""""""""""""""""""""""""
" Shell Section
""""""""""""""""""""""""""""""""""""""""""""""

if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""
" Twig Section
""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead *.twig set syntax=html filetype=html

""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""

let vim_markdown_folding_disabled = 1


""""""""""""""""""""""""""""""""""""""""""""""
" Latex
""""""""""""""""""""""""""""""""""""""""""""""

" Latex Compilation
" There are two ways to compile latex code:
"   1. vimtex
"   2. vimux
" Using vimtex will compile the code inside vim and gives very good error documentation
" Using vimux, ie. vim+tmux, we send a runner to compile latex manually in a terminal


set shortmess=a
""" Vimux
fun! CleanCurrentTex()
    call VimuxRunCommandInDir("cleantex", 1)
endfun
fun! OpenTexPdf()
    call VimuxRunCommandInDir("opentexpdf", 1)
endfun
fun! OpenCurrentTexmaker()
    w
    call VimuxRunCommandInDir("opencurrenttexmaker", 1)
endfun
fun! RunCurrentScriptandOpenTexPdf()
    w
    call VimuxRunCommandInDir("run-script", 1)
    call VimuxRunCommandInDir("opentexpdf", 1)
    set cmdheight=2
    set cmdheight=1
    echo "Latexmk: Compilation Complete, touching Preview"
endfun
fun! RunCurrentScriptNoSaveandUpdatePreview()
    call VimuxRunCommandInDir("run-script", 1)
    call VimuxRunCommandInDir("opentexpdf", 1)
    call VimuxRunCommandInDir("touchpreview", 1)
    set cmdheight=2
    set cmdheight=1
    echo "Latexmk: Compilation Complete, touching Preview"
endfun
fun! RunCurrentScriptandUpdatePreview()
    w
    call VimuxRunCommandInDir("run-script", 1)
    call VimuxRunCommandInDir("opentexpdf", 1)
    call VimuxRunCommandInDir("touchpreview", 1)
    set cmdheight=2
    echo "Latexmk: Compilation Complete, touching Preview"
    set cmdheight=1
endfun
fun! CdToFileDirectory()
    w
    call VimuxRunCommandInDir("cdtofile", 1)
endfun

fun! TexOpenCitations()
    call VimuxRunCommandInDir("open -a Preview Citations/Other/*", 0)
    call VimuxRunCommandInDir("opentexpdf", 1)
    call VimuxRunCommandInDir("osascript $HOME/.dotfiles/applescript/scripts/preview-merge-all.scpt", 0)
    call VimuxRunCommandInDir("touchpreview", 1)
endfun


nnoremap <leader>z :call RunCurrentScript()<cr>
autocmd FileType tex nnoremap <leader>~ :call RunCurrentScriptandOpenTexPdf()<cr>
autocmd FileType tex nnoremap <leader>` :call RunCurrentScriptandUpdatePreview()<cr>
autocmd FileType tex nnoremap <leader>c :call CleanCurrentTex()<cr>
autocmd FileType tex nnoremap <leader>o :call OpenTexPdf()<cr>
autocmd FileType tex nnoremap <leader>m :call OpenCurrentTexmaker()<cr>
autocmd FileType tex nnoremap <leader>tc :call TexOpenCitations()<cr>


""" Vimtex
fun! VimtexSaveContinuesCompileStart()
    set cmdheight=2
    w
    VimtexCompile
    set cmdheight=1
endfun
fun! VimtexSaveCompileOnce()
    w
    VimtexCompileSS
endfun
autocmd FileType tex nnoremap <leader>ll :call VimtexSaveContinuesCompileStart()<cr>
autocmd FileType tex nnoremap <leader>; :call VimtexSaveContinuesCompileStart()<cr>




" Updates preview after every succesful compile, which is after every save
"""""""""""""""""""""""""""""""""""""""
""""" !!!! Important, keep only one enabled
au User VimtexEventCompileSuccess :call VimuxRunCommandInDir("touchpreviewnosidebar", 1)
"autocmd BufWrite *.tex :call RunCurrentScriptNoSaveandUpdatePreview()


autocmd BufNewFile *.tex 0r /Users/riley/.dotfiles/vim/boilerplate/latex/riley_base.tex
autocmd FileType tex nnoremap <leader>; :call VimtexSaveCompile()<cr>





" Latex writing 
autocmd FileType tex nnoremap <leader>bb i\begin{align}<esc>o\end{align}<esc>O<tab><backspace>
autocmd FileType tex nnoremap <leader>bl i\begin{itemize}<esc>o\end{itemize}<esc>O<tab><backspace><backspace>\item<space>
autocmd FileType tex nnoremap <leader>be i\begin{enumerate}<esc>o\end{enumerate}<esc>O<backspace>\item<space>
autocmd FileType tex nnoremap <leader>bi i\begin{figure}<esc>o\end{figure}<esc>O\centering<cr>\includegraphics{images/}<cr>\label{fig1}<esc>kA<esc>i

"inoremap <C-i> <cr><backspace>\item<space>
autocmd FileType tex nnoremap <leader>// mm0eea[\checkmark]<esc>`m12l
autocmd FileType tex nnoremap <leader>/\ mm0eea[\XSolidBrush]<esc>`m14l
autocmd FileType tex nnoremap <leader>/. 0et]di]hxx 
autocmd FileType tex nnoremap <leader>aa mmA\\<esc>0t=a&<esc>`ml
autocmd FileType tex vnoremap <C-w> g<C-g>
