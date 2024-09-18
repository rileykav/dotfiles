" Code Commenting
" Use `:set filetype?` to check 
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
    \   "ps1": '#',
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
" au FileType python nnoremap <leader>` :call VimuxRunCommand("py ".expand("%"))<cr>





" Adds python boilerplate
" autocmd BufNewFile *.py 0r $HOME/.dotfiles/vim/boilerplate/python/riley_base.py





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
" Html Section
""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead *.twig set syntax=html filetype=html


" Html
autocmd BufRead *.htm call Epublean()





""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead *.md nnoremap o A<cr>

let vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
autocmd BufRead Markdown set textwidth=0 wrapmargin=0
autocmd BufRead Markdown nnoremap <leader>a mm0la~~<esc>A~~<esc>`m
autocmd BufRead *md nnoremap <leader>a mm0la~~<esc>A~~<esc>`m
autocmd BufRead *md nnoremap <leader>A mm0llxxA<esc>xx`m
nnoremap <leader>i i$\quad$<esc>o

set conceallevel=2  " From preservim/vim-markdown

" Edit selected text to add combined characters to give strikethrough, underline etc.
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

vnoremap  :Strikethrough<CR>
vnoremap __ :Underline<CR>




""""""""""""""""""""""""""""""""""""""""""""""
" Latex
""""""""""""""""""""""""""""""""""""""""""""""
set noshellslash
" Latex Compilation
" There are two ways to compile latex code:
"   1. vimtex
"   2. vimux
" Using vimtex will compile the code inside vim and gives very good error documentation
" Using vimux, ie. vim+tmux, we send a runner to compile latex manually in a terminal

"" Vimtex
" Haven't figure it out yet, but try mess around with lualatex, and 
" specifically with the \math



" To use with MacTex run the following:
"   % type latexmk
"   latexmk is /usr/loval/bin/latexmk
"   % sudo ln -s /usr/../latexmk /usr/local/bin
"
" Or try the directory: /Library/TeX/texbin/latexmk
" Might be the same file ?
"
" For multifle support, use one of the following
" 1. Set up a main.tex file, and the following to your vimrc
"   autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'
"
" 2. At the start of all none main files include as the first line:
"   %! TEX root = <main-tex-file-name>.tex
"
" I have the second set up so that my tex files follow a patern of name.tex 
" as the main file, and all subiles are name.appendix.tex, name.bib.tex etc.
"
let g:vimtex_compiler_enabled = 1 " (Dis/En)ables Compiler
"
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'texworks.exe'
let g:vimtex_compiler_latexmk = {
    \ 'callback' : 0,
    \ 'continuous' : 0,
    \}
" Set tex type to latex
" let g:tex_flavor = 'latex' "Never got working
" let g:vimtex_compiler_progname = 'latexmk'
" let g:vimtex_compiler_progname = 'latexmk'
if has("win32")
"         There is a command to view pdf in VimTex: VimTexView
        let g:vimtex_view_method = 'general'
        let g:vimtex_view_general_viewer = 'sumatra'
"         let g:vimtex_view_general_viewer = 'msedge'
"         let g:vimtex_view_general_viewer = 'arc'   " Refuses to open files?
"         let g:vimtex_view_general_viewer = 'okular'
"         let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'   " Broken?
"         let g:vimtex_view_general_viewer = 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'   "Invalid viewer
else
    if has("macunix")
        let g:vimtex_view_method = 'skim'
    endif
endif
" let g:vimtex_compiler_latexmk_engines = {
"         \ '_'                : '-pdf',
"         \ 'pdflatex'         : '-pdf',
"         \ 'dvipdfex'         : '-pdfdvi',
"         \ 'lualatex'         : '-lualatex',
"         \ 'xelatex'          : '-xelatex',
"         \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
"         \ 'context (luatex)' : '-pdf -pdflatex=context',
"         \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
"         \}
" let g:vimtex_compiler_engine = 'latexmk'
" let g:vimtex_compiler_method = 'latexmk' "Default setting
" let g:vimtex_compiler_method = 'lualatex' "Default setting
" let g:vimtex_compiler_latexmk = {
"         \ 'build_dir' : '',
"         \ 'callback' : 1,
"         \ 'continuous' : 1,
"         \ 'executable' : 'latexmk',
"         \ 'hooks' : [],
"         \ 'options' : [
"         \   '-lualatex',
"         \   '-quiet',
"         \   '-file-line-error',
"         \   '-synctex=1',
"         \   '-interaction=nonstopmode',
"         \ ],
"         \}
" let g:vimtex_compiler_latexmk = {
"         \ 'build_dir' : '',
"         \ 'callback' : 1,
"         \ 'continuous' : 1,
"         \ 'executable' : 'latexmk',
"         \ 'hooks' : [],
"         \ 'options' : [
"         \   '-lualatex',
"         \   '-quiet',
"         \ ],
        \}
" let g:vimtex_compiler_latexrun = {
"         \ 'build_dir' : '',
"         \ 'options' : [
"         \   '-verbose-cmds',
"         \   '--latex-args="-synctex=1"',
"         \ ],
"         \}

" let g:vimtex_syntax_conceal_default = 0 " Doesn't work....
" let g:vimtex_compiler_latexmk = {
"         \ 'build_dir' : '',
"         \ 'callback' : 1,
"         \ 'continuous' : 1,
"         \ 'executable' : 'latexmk',
"         \ 'hooks' : [],
"         \ 'options' : [
"         \   '-quiet',
"         \   '-synctex=1',
"         \   '-interaction=nonstopmode',
"         \ ],
"         \}
" let g:vimtex_compiler_latexmk = {
"     \ 'build_dir' : '',
"     \ 'callback' : 1,
"     \ 'continuous' : 1,
"     \ 'executable' : 'latexmk',
"     \ 'hooks' : [],
"     \ 'options' : [
"     \   '-verbose',
"     \   '-file-line-error',
"     \   '-synctex=1',
"     \   '-interaction=nonstopmode',
"     \ ],
"     \}



"--------------- Lualatex (Not Working) ---------------"
" let g:vimtex_compiler_progname = 'nvr'
" let g:vimtex_compiler_latexmk_engine = 'lualatex'
" set nocompatible
" filetype plugin indent on
" syntax enable
" let g:vimtex_compiler_progname = 'nvr'
" let g:tex_flavor = 'latex'
" let g:vimtex_view_method = 'skim'
" let g:vimtex_quickfix_mode = 0
" let g:vimtex_compiler_latexmk = {
"   \ 'build_dir' : 'dist',
"   \}














" syntax enable
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let maplocalleader = ","
" let g:vimtex_indent_enabled = 0
" UltiSnips
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Ignores unnecessary warnings
let g:vimtex_quickfix_ignore_filters = [
  \'Package natbib Warning: Citation',  
  \'LaTeX Warning: Reference',          
  \'LaTeX Warning: There were undefined references',          
  \'LaTeX Warning: Label(s) may have changed.',          
  \'Underfull \\hbox (badness [0-9]*) in ',
  \'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in ',
  \'Overfull \\vbox ([0-9]*.[0-9]*pt too high) detected ',
  \'Package hyperref Warning: Token not allowed in a PDF string',
  \"Package option `hyperref' is obsolete and ignored",
  \'Package typearea Warning: Bad type area settings!',
  \'Package nameref Warning: The definition of \\label has changed!',
  \'Marginpar on page[0-9]* moved',
  \'Marginpar on page[0-9]* moved',
  \'Marginpar',
  \'Overfull',
  \'LaTeX Warning: Float too large for page',
  \'tikz-feynman Warning',
  \"`h' float specifier",
  \"requested document class",
  \"Missing",
  \"A float is stuck",
  \"empty link",
  \"Not loaded"
  \]

" Vim-Latex " Disabled
set iskeyword+=: "Enables fig:<autocompletion> with <C-n> 
set iskeyword-=} " word boundary
"let b:suppress_latex_suite = 1 "Disables vim-latex



set shortmess=a

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

"
" Updates preview after every succesful compile, which is after every save
"""""""""""""""""""""""""""""""""""""""
""""" !!!! Important, keep only one enabled
" au User VimtexEventCompileSuccess :call VimuxRunCommandInDir("touchpreviewnosidebar", 1)
" autocmd BufWrite *.tex :call RunCurrentScriptNoSaveandUpdatePreview()

au FileType tex nnoremap <leader>o :VimtexView<cr>

if has("win32")
    " Windows Options
    
"             au User VimtexEventCompileSuccess :echo "done"

else
    if has("unix")
        if has("macunix")

            au User VimtexEventCompileSuccess :call VimuxRunCommandInDir("updateduplicatetexpdf", 1)
        endif
    endif
endif


" Table of Contents
" let g:vimtex_toc_config = {
"     \ 'layer_status': {
"         \ 'content': 1,
"         \ 'label': 0,
"         \ 'todo': 0,
"         \ 'include': 0
"     \ },
"     \ 'show_help': 0,
"     \ 'indent_levels': 0
" \ }

"     \ 'resize': 1,
"     \ 'split_width': 26

" let g:vimtex_fold_enabled=1




fun! LoadTexTemplate()
    set cmdheight=2
"     0r $HOME/.dotfiles/vim/boilerplate/latex/riley_base.tex
    0r $HOME/.dotfiles/tex/main.tex
"     0r $HOME/.dotfiles/vim/boilerplate/latex/riley_base.tex
    0r $HOME/.dotfiles/tex/main.tex
    set cmdheight=1
endfun

autocmd BufNewFile *.tex call LoadTexTemplate()
" autocmd BufNewFile *.tex 0r $HOME/.dotfiles/vim/boilerplate/latex/riley_base.tex
" autocmd BufNewFile *.tex 0r $HOME/.dotfiles/vim/boilerplate/latex/riley_base.tex
"
"
"
" autocmd FileType tex nnoremap <leader>; :call VimtexSaveCompile()<cr>





" Latex writing
" autocmd FileType tex nnoremap <leader>bb i\begin{align}<esc>o\end{align}<esc>O<tab><backspace>
" autocmd FileType tex nnoremap <leader>bl i\begin{itemize}<esc>o\end{itemize}<esc>O<tab><backspace><backspace>\item<space>
" autocmd FileType tex nnoremap <leader>be i\begin{enumerate}<esc>o\end{enumerate}<esc>O<backspace>\item<space>
" autocmd FileType tex nnoremap <leader>bi i\begin{figure}<esc>o\end{figure}<esc>O\centering<cr>\includegraphics{images/}<cr>\label{fig1}<esc>kA<esc>i

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



"--------------- Txt ---------------"
"" Set the sytax style to markdown
au BufRead *txt set syntax=markdown





"--------------- WolframScript ---------------"

autocmd BufNewFile,BufRead *.wl set syntax=wl
autocmd BufNewFile,BufRead *.wls set syntax=wl
autocmd BufNewFile,BufRead *.m set syntax=wl
