" Mac specific options

"" Vimux
let dir = expand('%:p:h')

nnoremap <leader>d :call VimuxRunCommand("cd '" . dir . "'")<cr>
nnoremap <leader>. :call VimuxPromptCommand()<cr>
nnoremap <leader>saf :call VimuxPromptCommand("safari-search ")<cr>
let g:VimuxOrientation = "v"

fun! SafariSearch(search_term="false00")
    if a:search_term=="false00"
        let local_search=input("Safari Search? ")
    else
        let local_search=a:search_term
    endif
    VimuxRunCommand('safari-search "' . local_search . '" && open /Applications/Safari.app')
endfun

nnoremap <leader>saf :call SafariSearch()<cr>



function! s:get_visual_selection()
    " Credit to xolox at https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! VisualSearch()
    let search=s:get_visual_selection()
    call SafariSearch(search)
endfunction
xnoremap <leader>saf :call VisualSearch()<cr>



" Saves file Run script in tmux shell bellow (doesnt need executible if sh or py)
fun! RunCurrentScript()
    w
    call VimuxRunCommandInDir("run-script", 1)
    set cmdheight=2
    echo "Script Complete"
    set cmdheight=1
endfun



""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""
function! OpenMarkdownViewer()
    call VimuxRunCommandInDir("open", 1)
endfunction    
autocmd FileType Markdown nnoremap <leader>o :call OpenMarkdownViewer()<cr>





""""""""""""""""""""""""""""""""""""""""""""""
" Latex
""""""""""""""""""""""""""""""""""""""""""""""
" Latex Compilation
" There are two ways to compile latex code:
"   1. vimtex
"   2. vimux
" Using vimtex will compile the code inside vim and gives very good error documentation
" Using vimux, ie. vim+tmux, we send a runner to compile latex manually in a terminal
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

nnoremap <leader>z :call RunCurrentScript()<cr>
autocmd FileType tex nnoremap <leader>~ :call RunCurrentScriptandOpenTexPdf()<cr>
autocmd FileType tex nnoremap <leader>` :call RunCurrentScriptandUpdatePreview()<cr>
autocmd FileType tex nnoremap <leader>c :call CleanCurrentTex()<cr>
autocmd FileType tex nnoremap <leader>o :call OpenTexPdf()<cr>
autocmd FileType tex nnoremap <leader>O :call OpenDuplicateTexPdf()<cr>
autocmd FileType tex nnoremap <leader>m :call OpenCurrentTexmaker()<cr>
autocmd FileType tex nnoremap <leader>tc :call TexOpenCitations()<cr>

autocmd QuitPre *.tex {call CleanCurrentTex()}
"" vim-tmux-runner (Use VIMUX to doe this?)
" Helps make python work right
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

"nmap <leader>ta :call VtrSendLinesToRunner()<cr>
let g:VtrUseVtrmaps = 1



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
