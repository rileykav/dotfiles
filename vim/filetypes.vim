" Code Commenting

let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "snippets": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "zsh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \   "bib": '%',
    \   "octave": '%',
    \   "sift": '//',
    \ }

        


function! ToggleCommentRelativePosition()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction
function! ToggleCommentZeroPosition()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^" . comment_leader . " //"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . " //"
            else
                " Comment the line
                execute "silent s/^/" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction


nnoremap <leader><leader> :call ToggleCommentZeroPosition()<cr>
vnoremap <leader><leader> :call ToggleCommentZeroPosition()<cr>
"--------------- This is a Header  ---------------"
function InsertCommentHeader()
    let CommentPrefix=s:comment_map[&filetype]
    let CommentHeader=CommentPrefix."---------------  ---------------".CommentPrefix
    put =CommentHeader
    execute "norm t ll"

endfunction
nnoremap <leader>// :call InsertCommentHeader()<cr>




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
" au FileType python nnoremap <leader>` :call VimuxRunCommand('./'w:filename)
au FileType python nnoremap <leader>` :call VimuxRunCommand("py ".expand("%"))<cr>
au FileType python let comment = "#"





" Adds python boilerplate
" autocmd BufNewFile *.py 0r /Users/riley/.dotfiles/vim/boilerplate/python/riley_base.py
autocmd BufNewFile *.py call NewPythonFile()
function NewPythonFile()
    let date=system('date')[0:-2] " Slice removes a ^@ character at end?
    let user='riley'
"     let pypath='/usr/local/bin/python3.10'
    let pypath=system('echo $PYTHONPATH')[0:-2]
    call append(0, "#!".pypath)
    call append(1, "# -*- coding: utf-8 -*-")
    call append(2, '"""')
    call append(3, "Created on ".date)
    call append(4, "")
    call append(5, "@author: ".user)
    call append(6, '"""')
endfunction


""""""""""""""""""""""""""""""""""""""""""""""
" C Section
""""""""""""""""""""""""""""""""""""""""""""""






""""""""""""""""""""""""""""""""""""""""""""""
" C++ Section
""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.cpp call NewCPPFile()
function NewCPPFile()
    let date=system('date')[0:-2] " Slice removes a ^@ character at end?
    let user='riley'
"     let pypath='/usr/local/bin/python3.10'
    call append(0, "// Created on ".date)
    call append(1, "// @author: ".user)
    call append(2, "")
    call append(3, "#include <iostream>")
endfunction

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


" if exists('$TMUX') 
"     if has('nvim')
"         set termguicolors
"     else
"         set term=screen-256color 
"     endif
" endif
""""""""""""""""""""""""""""""""""""""""""""""
" Twig Section
""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead *.twig set syntax=html filetype=html


" Html
autocmd BufRead *.htm call Epublean()


""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""

let vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
autocmd BufRead Markdown set textwidth=0 wrapmargin=0
nnoremap <leader>i i$\quad$<esc>o
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
    call VimuxRunCommandInDir("updateduplicatetexpdf", 1)
endfun
fun! OpenDuplicateTexPdf()
    call VimuxRunCommandInDir("openduplicatetexpdf", 1)
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
    call VimuxRunCommandInDir("updateduplicatetexpdf", 1)
    set cmdheight=2
    set cmdheight=1
    echo "Latexmk: Compilation Complete, touching Preview"
endfun
fun! RunCurrentScriptandUpdatePreview()
    w
    call VimuxRunCommandInDir("run-script", 1)
    call VimuxRunCommandInDir("opentexpdf", 1)
    call VimuxRunCommandInDir("updateduplicatetexpdf", 1)
    set cmdheight=2
    echo "Latexmk: Compilation Complete, touching Preview"
    set cmdheight=1
endfun
fun! CdToFileDirectory()
    w
    call VimuxRunCommandInDir("cdtofile", 1)
endfun

fun! TexOpenCitations()
    call VimuxRunCommandInDir("open -a Skim Citations/Other/*", 0)
    call VimuxRunCommandInDir("opentexpdf", 1)
    call VimuxRunCommandInDir("osascript $HOME/.dotfiles/applescript/scripts/preview-merge-all.scpt", 0)
    call VimuxRunCommandInDir("touchpreview", 1)
endfun

function! NotesOpen()
    let NumFiles=0
    for FILE in split(globpath('.','notes*.tex'))
"         echo FILE
        silent execute 'edit' FILE[2:]
        let NumFiles+=1
    endfor
    for FILE in split(globpath('.','notes*.bib'))
"         echo FILE
        silent execute 'edit' FILE[2:]
        let NumFiles+=1
    endfor
    silent buffer notes.main.tex
    echo "Opened ".NumFiles." Files"
endfunction
command NotesOpen call NotesOpen()
function! PaperOpen()
    let NumFiles=0
    for FILE in split(globpath('.','paper*.tex'))
"         echo FILE
        silent execute 'edit' FILE[2:]
        let NumFiles+=1
    endfor
    for FILE in split(globpath('.','paper*.bib'))
"         echo FILE
        silent execute 'edit' FILE[2:]
        let NumFiles+=1
    endfor
    silent buffer paper.thoughts.tex
    echo "Opened ".NumFiles." Files"
endfunction
command PaperOpen call PaperOpen()

function! ThesisOpen()
    let NumFiles=0
    for FILE in split(globpath('.','*.tex'))
"         echo FILE
        silent execute 'edit' FILE[2:]
        let NumFiles+=1
    endfor
    for FILE in split(globpath('.','*.bib'))
"         echo FILE
        silent execute 'edit' FILE[2:]
        let NumFiles+=1
    endfor
    silent buffer thesis.thoughts.tex
    echo "Opened ".NumFiles." Files"
endfunction
command ThesisOpen call ThesisOpen()

nnoremap <leader>z :call RunCurrentScript()<cr>
autocmd FileType tex nnoremap <leader>~ :call RunCurrentScriptandOpenTexPdf()<cr>
autocmd FileType tex nnoremap <leader>` :call RunCurrentScriptandUpdatePreview()<cr>
autocmd FileType tex nnoremap <leader>c :call CleanCurrentTex()<cr>
autocmd FileType tex nnoremap <leader>o :call OpenTexPdf()<cr>
autocmd FileType tex nnoremap <leader>O :call OpenDuplicateTexPdf()<cr>
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
    set cmdheight=2
    w
    VimtexCompileSS
    set cmdheight=1
endfun
autocmd FileType tex nnoremap <leader>ll :call VimtexSaveContinuesCompileStart()<cr>
autocmd FileType tex nnoremap <leader>; :call VimtexSaveCompileOnce()<cr>

autocmd FileType tex nnoremap <leader>td i\todo[inline]{}<esc>

autocmd FileType tex set iskeyword-=_ 



" Table of Contents
let g:vimtex_toc_config = {
    \ 'layer_status': {
        \ 'content': 1, 
        \ 'label': 0, 
        \ 'todo': 0, 
        \ 'include': 0
    \ },
    \ 'show_help': 0,
    \ 'indent_levels': 0
\ }

"     \ 'resize': 1,
"     \ 'split_width': 26

" let g:vimtex_fold_enabled=1



"
" Updates preview after every succesful compile, which is after every save
"""""""""""""""""""""""""""""""""""""""
""""" !!!! Important, keep only one enabled
" au User VimtexEventCompileSuccess :call VimuxRunCommandInDir("touchpreviewnosidebar", 1)
" autocmd BufWrite *.tex :call RunCurrentScriptNoSaveandUpdatePreview()

au User VimtexEventCompileSuccess :call VimuxRunCommandInDir("updateduplicatetexpdf", 1)


fun! LoadTexTemplate()
    set cmdheight=2
    0r /Users/riley/.dotfiles/vim/boilerplate/latex/riley_base.tex
    set cmdheight=1
endfun

autocmd BufNewFile *.tex call LoadTexTemplate()
" autocmd BufNewFile *.tex 0r /Users/riley/.dotfiles/vim/boilerplate/latex/riley_base.tex
"
"
"
" autocmd FileType tex nnoremap <leader>; :call VimtexSaveCompile()<cr>





" Latex writing 
autocmd FileType tex nnoremap <leader>bb i\begin{align}<esc>o\end{align}<esc>O<tab><backspace>
autocmd FileType tex nnoremap <leader>bl i\begin{itemize}<esc>o\end{itemize}<esc>O<tab><backspace><backspace>\item<space>
autocmd FileType tex nnoremap <leader>be i\begin{enumerate}<esc>o\end{enumerate}<esc>O<backspace>\item<space>
autocmd FileType tex nnoremap <leader>bi i\begin{figure}<esc>o\end{figure}<esc>O\centering<cr>\includegraphics{images/}<cr>\label{fig1}<esc>kA<esc>i

"inoremap <C-i> <cr><backspace>\item<space>
" autocmd FileType tex nnoremap <leader>CM

" Checkmark
autocmd FileType tex nnoremap <leader>/\ mm0eea[\checkmark]<esc>`m14l 
" autocmd FileType tex nnoremap <leader>/\ mm0eea[\XSolidBrush]<esc>`m14l 
autocmd FileType tex nnoremap <leader>/. 0et]di]hxx 
autocmd FileType tex nnoremap <leader>aa mmA\\<esc>0t=a&<esc>`ml
autocmd FileType tex vnoremap <C-w> g<C-g>
autocmd FileType tex set complete-=i
" autocmd FileType tex inoremap <tab> <c-x><c-o>
" autocmd FileType tex inoremap <c-tab> <tab>

function! CleverTab()
	   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
	      return "\<Tab>"
	   else
	      return "\<C-x>\<C-o>"
	   endif
endfunction
autocmd FileType tex inoremap <Tab> <C-R>=CleverTab()<CR>
autocmd FileType tex nnoremap <leader>w :wa
" inoremap <Tab> <C-x>CleverTab()
""""""""""""""""""""""""""""""""""""""""""""""
" Octave Section
""""""""""""""""""""""""""""""""""""""""""""""
au FileType octave nnoremap ; mmA;<esc>`m
function SaveAndRunOctave()
    w
    VimuxRunCommand(LocalFilename())

endfunction
au FileType octave nnoremap <leader>z :call SaveAndRunOctave()<cr>
au FileType octave nnoremap <leader>cl :VimuxRunCommand('clc')<cr>




"--------------- Txt ---------------"
"" Set the sytax style to markdown
au BufRead *txt set syntax=markdown





"--------------- WolframScript ---------------"

autocmd BufNewFile,BufRead *.wl set syntax=wl
autocmd BufNewFile,BufRead *.wls set syntax=wl
autocmd BufNewFile,BufRead *.m set syntax=wl
