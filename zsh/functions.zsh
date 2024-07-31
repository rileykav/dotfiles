#######################################################
# Functions
#######################################################
source "$HOME/.dotfiles/zsh/alias.zsh"

EXT_LIST=(
    "py"
    "sh"
    )




function walletlost(){
    echo "Cancel ptsb and revolut card"
    echo "Replace drivers liscence"
    echo "Replace student card"
    echo "Replace keepass"
}
function vime(){
    if [[ -a $1  ]]; then
        mvim -v $1
    else
        EXT="${1##*\.}"
        for x in $EXT_LIST; do
            if [[ $EXT == $x ]]; then
                cp "$MYCOMMANDS/Default-Script-Files/default.$EXT" "$1"
                chmod 700 "$1"
                mvim -v "$1"
            else
                mvim -v "$1"
            fi
        done
    fi
}


IMG_EXT=(
    'png'
    'jpeg'
    )

VID_EXT=(
    'mkv'
    'mp4'
    'm4p'
    'mpg'
    'mpv'
    'ogg'
    'avi'
    'flv'
    )


function gen-html(){
    mkdir "$1" && cd $1
    cp "$MYCOMMANDS/Default-Script-Files/default.html" "index.html"
    mkdir "images"
    cp -r "$MYCOMMANDS/Default-Icons" "icons/"
}



function v(){
    #Defunct, achieveseverthing the same result as open
    #though allows a different default when opening
    in terminal... probably not necessary
    EXT="${@##*\.}"
    if [[ $EXT == 'pdf' ]]; then
        echo "pdf"
        open $DEFAULT_PDF $@
    elif [[ $EXT == 'png' || $EXT == 'jpeg' ]]; then
        echo "img"
        open $DEFAULT_IMG $@
    elif [[ ${VID_EXT[(r)EXT]} -le  ${#VID_EXT} ]]; then #true for all
        echo "vid"
        open $DEFAULT_VID $@
    elif [[ $EXT == 'svg' ]];  then
        echo "svg"
        open $DEFAULT_SVG $@
    else
        echo "none, extension: $EXT"
    fi
}



function zip-to-cbz(){
    # Tool used to convert the zip file from a azw3 calibre convert to zip to a cbz file.
    #
    filename="${1%.*}"
    FILE_EXT="${1##*\.}"
    if [[ $FILE_EXT == 'zip' ]]; then
        #mkdir $filename
        #unzip -q $1 -d "$filename/$filename"
        cp -r $filename/$filename/*/images $filename/
        cp $filename/$filename/*/cover.jpeg .
        cp cover.jpeg $filename/images/"0000cover.jpeg"
        mv cover.jpeg $filename/images/"00001.jpeg"
        zip --quiet $filename/archive.zip $filename/images/*
        mv $filename/archive.zip "$filename.cbz"
        rm -fr $filename
    else
        echo "Is not Zip"
        echo $EXT
    fi
}
function runc(){
    # Compiles and runs C files, makes a hidden .out file
    FILE_EXT="${1##*\.}"
    filename="${1%.*}"
    output_file=".$filename.out"
    if [[ $FILE_EXT == 'c' ]]; then
        gcc "$1" -o "$output_file"
        "$dir/$output_file"
    else
        echo "Error Code 1: Not a C file"
        echo "did you mean: $filename.c ?"
    fi 
}
function runcpp(){
    # Compiles and runs C files, makes a hidden .out file
    dir=$(dirname "$1")
    file=$(basename $1)
    file_ext="$(echo ${file##*\.})"
    filename="$(echo ${file%.*})"
    output_file=".$filename.out"
    if [[ $file_ext == 'cpp' ]]; then
        g++ "$1" -std=c++17  -o "$output_file"
        "$dir/$output_file"
    else
        echo "Error Code 1: Not a C++ file"
        echo "did you mean: $filename.cpp ?"
    fi 
}
function getmaintexstem(){
    local dir=$(dirname "$1")
    if [[ -f "$dir/.tex_main" ]]; then # Check if the multifile config file exsits
        local maintex=$(cat "$dir/.tex_main")
        echo "${maintex%.*}"
    else
        echo "${1%.*}"
    fi
}
function cleantex(){
    local filename=$(getmaintexstem $1)
    # Ensures the wildfire matches something
    #     touch "pdflatextmp.txt"
    #     touch "$filname""_vimtex.txt"
    rm -f "$filename.aux" "$filename.bbl" "$filename.tex.bbl" "$filename.tex.blg" "$filename.fls" "$filename.log" "$filename.toc" "$filename.out" "$filename.fdb_latexmk" "$filename.synctex(busy)" "$filename.synctex.gz" ".latexrun*"  "$filename.bcf" "$filename.dvi" "$filename.blg" "$filename.run.xml" "$filename.synctex (busy)" "pdfa.xmpi" "texput.fls" "texput.log" pdflatex*(N) *vimtex*(N) *.aux(N)
    #     "$filename""_vimtex"*
}
function opentexpdf(){
    open $(getmaintexstem $1)".pdf"
}
function updateduplicatetexpdf(){
    local filename=$(getmaintexstem $1)
    if [[ -f "$filename.duplicate.pdf" ]]; then # Check if the Duplicate file exists
        cp "$filename.pdf" "$filename.duplicate.pdf" 
    fi
}
function openduplicatetexpdf(){
    local filename=$(getmaintexstem $1)
    cp "$filename.pdf" "$filename.duplicate.pdf" 
    open "$filename.duplicate.pdf"
}
function cdtofile(){
    directory=$(pwd)
    echo $directory
    cd $directory
}

function testepub(){
    local filename="${1%.*}"
    local dir="$filename-epub-files"
    mv $1 $filename"-old.epub"
    unzip $1"-old" -d $dir
    vim $dir
    zip -X0 $1 $dir/mimetype
    zip -Xur9D $1 $dir/*
    
}


# function touchpreviewnosidebar(){
#     open /System/Applications/Preview.app 
#     osascript "$HOME/.dotfiles/applescript/scripts/preview-remove-sidebar.scpt"
#     open /Applications/iTerm.app 
# }
# function opencurrenttexmaker(){
#     filename="${1%.*}"
#     open /Applications/texmaker.app "$filename.tex"
# }

# Switched to Skim instead, so no longer used
# function touchpreview(){
#     open /System/Applications/Preview.app
#     osascript "$HOME/.dotfiles/applescript/scripts/preview-remove-sidebar.scpt"
#     open /Applications/iTerm.app
# }

function runtex(){
#     latexmk -lualatex --pdf -quiet $1
#     latexmk -lualatex -silent -latexoption="-synctex=1" $1
    latexmk -lualatex -quiet $(getmaintexstem $1)
}

function runmdtohtml(){
    filename="${1%.*}"
    markdown $1 > "$filename.html"
    open "$filename.html"
    open /Applications/iTerm.app
}
function runmd(){
#     filename="${1%.*}"
#     markdown $1 > "$filename.html"
#     open "$filename.html"
#     open /Applications/iTerm.app
    open $1 -a /Applications/Obsidian.app
}

function run-script(){
    filename="${1%.*}"
    FILE_EXT="${1##*\.}"
    if [[ $FILE_EXT == 'sh' ]]; then
        /bin/zsh $1
    elif [[ $FILE_EXT == 'py' ]]; then
        /usr/local/bin/python3.10 $1
    elif [[ $FILE_EXT == 'scpt' ]]; then
        osascript $1
    elif [[ $FILE_EXT == 'c' ]]; then
        runc $1 
    elif [[ $FILE_EXT == 'cpp' ]]; then
        runcpp $1 
    elif [[ $FILE_EXT == 'bib' ]]; then
        runtex $1 
    elif [[ $FILE_EXT == 'tex' ]]; then
        runtex $1 
    elif [[ $FILE_EXT == 'md' ]]; then
        runmd $1 
    elif [[ $FILE_EXT == 'R' ]]; then
        Rscript $1 
    elif [[ $FILE_EXT == 'm' ]]; then
        octave $1 
    elif [[ $FILE_EXT == 'swift' ]]; then
        swift $1 
    elif [[ $FILE_EXT == 'wls' ]]; then
        wolframscript -f $1
    else
        echo "Not a known script, please edit run-script in zshrc"
        echo "$1"
    fi
}

function safari-search(){
    osascript -e 'tell application "Safari" to search the web for "'$1'"'
}


function zsh-temp(){
    DOTFILES_TEMP="$HOME/.dotfiles/temp"
    #echo $DOTFILES_TEMP
    if [[ -d $DOTFILES_TEMP ]]; then
        find $DOTFILES_TEMP -mindepth 1 -depth -exec rm -rf {} ';'
    else
        mkdir $DOTFILES_TEMP
    fi
    FILE_EXT="${1##*\.}"
    if [[ $FILE_EXT == '.zshrc' || $filename == 'zshrc' ]]; then
        cp $1 $DOTFILES_TEMP/.zshrc
        ZDOTDIR=$DOTFILES_TEMP zsh
    else
        if read -q "REPLY?File not a zshrc, do you want to run anyway [y/n]?"; then
            cp $1 $DOTFILES_TEMP/.zshrc
            ZDOTDIR=$DOTFILES_TEMP zsh
        fi
    fi
}

function vim-temp(){
    file_ext="${1##*\.}"
    filename="${1%.*}"
    if [[ $file_ext == '.vimrc' || $filename == 'vimrc' ]]; then
        vim -u $1
    elif read -q "REPLY?File not a zshrc, do you want to run anyway [y/n]?"; then
        vim -u 
    else
        echo "Not vimrc file!!"
        echo $1
    fi
}

function gnew () {
    if [ $# -eq 1 ]; then
        mkdir $1    
        cd $1
        git init
        touch README.md
        git add .
        git commit -m 'first commit'
        git branch -M main
        gh repo create $1 --confirm --public
        git push --set-upstream origin main
    else
        echo "Please specify project name - 1 argument only"
    fi
}
function newsubject(){
    mkdir $1
    mkdir $1/"General"
    mkdir $1/"Lecture Notes"
    mkdir $1/"Problem Sheets"
    mkdir $1/"Problem Sheets"/"Solutions"
    mkdir $1/"Books"
    mkdir $1/"Books"/"Other"
    mkdir $1/"Homework"
    mkdir $1/"Homework"/"Solutions"
    #touch $1/"info.txt"
}




function scihubdown(){
    for x in $@; do
        NAME="$(basename $x)"

        scihubfolder="/Users/riley/Programming/scihub.py-master/scihub"
        rm -fr $scihubfolder/tmp
        mkdir $scihubfolder/tmp
        py $scihubfolder/scihub.py -d $x -o $scihubfolder/tmp 
        mv $scihubfolder/tmp/* "/Users/riley/Downloads/paper-$NAME.pdf"
    done
}


# By sourcing the alias' file, you can use alias' inside functions, neat!!
#function utrechtupload() {
#    /bin/zsh $HOME/Utrecht/NS-TP428M\ -\ General\ Relativity/Problem\ Sheets/.joingr.sh
#    /bin/zsh $HOME/Utrecht/NS-TP402M\ -\ Statistical\ Field\ Theory/Problem\ Solving/.joinsft.sh    
#    /bin/zsh $HOME/Utrecht/NS-TP401M\ -\ Quantum\ Field\ Theory/Problem\ Sheets/.joinqft.sh
#    rclone -P sync $HOME/Utrecht/ mydrive:Utrecht
#}

function cpmd() { #DOESN"T SEEM TO WORK
    # copies files and makes intermediate dest. directories if they don't exist
    # for bash, ksh or zsh
    # by Dennis Williamson - 2009-06-14
    # http://stackoverflow.com/questions/993266/unable-to-make-nosuchdirectory-message-useful-in-zsh

    # WARNING: no validation is performed on $1 and $2

    # all cp commands below are hardcoded with -i (interactive) to prevent overwriting

   if [[ -n $KSH_VERSION ]]
   then
       alias local=typeset
       local func="$0"
       local lastchar="${2: -1}"
       readcmd () { read "$2?$1"; }
    elif [[ -n $ZSH_VERSION ]]
    then
        local func="$0"
        # the following two lines are split up instead of doing "${2[-1]}"
        # to keep ksh from complaining when the function is loaded
        local dest="$2"
        local lastchar="${dest[-1]}"
        readcmd () { read "$2?$1"; }
    elif [[ -n $BASH_VERSION ]]
    then
    local func="$FUNCNAME"
        local lastchar="${2:(-1)}"
        readcmd () { read -p "$1" $2; }
    else
        echo "cpmd has only been tested in bash, ksh and zsh." >&2
        return 1
    fi

    local DEBUG='echo' # COMMENT THIS OUT to make this function actually work

    if [[ ${#@} != 2 ]]
    then
        echo "$func: invalid number of parameters
Usage:
  $func source destination

  where 'destination' can include nonexistent directories (which will
  be created). You must end 'destination' with a / in order for it to
  specify only directories. Without the final slash, the 'source' will
  be copied with a new name (the last portion of 'destination'). If you
  are copying multiple files and 'destination' is not a directory, the
  copy will fail." >&2
        return 1
    fi

    local dir=$(dirname "$2")
    local response
    local nl=$'\n'

    # destination ($2) is presumed to be in one of the following formats:
    # .../existdir              test 1  (-d "$2")
    # .../existdir/existfile    test 2  (-f "$2")
    # .../existdir/newfile      test 3  (-d "$dir" && $lastchar != '/')
    # .../existdir/newdir/      (else)
    # .../newdir/newdir/        (else)
    # .../newdir/newfile        (else)

    if [[ -d "$2" || -f "$2" || (-d "$dir" && $lastchar != '/') ]]
    then
        $DEBUG cp -i "$1" "$2"
    else
        if [[ $lastchar == '/' ]]
        then
            dir="$2"
        fi
        local prompt="$func: The destination directory...${nl}  ${dir}${nl}...does not exist. Create? (y/n): "
        while [[ -z $response ]]
        do
            readcmd "$prompt" response
            case $response in
                y|Y) response="Y" ;;
                n|N) ;;
                *) response=
                   prompt="$func: Invalid response.${nl}  Create destination directory? (y/n): ";;
            esac
        done
        if [[ $response == "Y" ]]
        then
            $DEBUG mkdir -p "$dir" && $DEBUG cp -i "$1" "$2"
        else
            echo "$func: Cancelled." >&2
        fi
    fi
}



function msplot(){
    here=$(pwd)
    cd '/Users/riley/Utrecht/NS-TP432M Modelling and Simulation/Homework/Homework 6/ising-2d'
    run-script 'auto.py'
    run-script 'energy.py'
    run-script 'mag.py'
    run-script 'spec_heat_capacity.py'
    cd $here
}
function msgif(){
    here=$(pwd)
    cd '/Users/riley/Utrecht/NS-TP432M Modelling and Simulation/Homework/Homework 6/ising-2d'
    rm data-spin/*.dat 
    rm plots/*.png 
    run-script 'ising-2D.c'
    run-script 'mag.py'
    run-script 'plot_spin.py'
    convert -delay 2 -loop 5 plots/*.png spin.gif
    cd $here
}

function converttogif(){
    ## Function to generate a gif from a colection of images.
    ## png files work best. To convert from pdf see
    ## convertpdftopng
    ## Usage: Given a collection of files, eg by some wild
    ## card finder - files* -; run the following
    # $ converttogif files*
    convert -dispose previous -delay 20 -loop 5 $@ out.gif
}


## Convert requires - imagemagick - to work, run
# $ brew install imagemagick
## to intall this. If you run into issues try googleing
## imagemagick convert 
function convertpdftopng(){
    ## Function to convert a list of pdf files to images

    for file in $@; do
        file_ext="${file##*\.}"    # Gives the file extension
        filename="${file%.*}"      # Strips the file extension
        convert -density 600 -quality 90 $file "$filename.png"
    done
}
function pdfmerge(){ 
    gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$1" "${@:2}"
}
function pngmerge(){
    # Install imagemagick first
    convert ${@:2} $1
}

function tns(){
    tmux new-session -A -s $1
}
function tnsprim(){
    tmux new-session -A -s $1 \; \
        source $HOME/.dotfiles/tmux/primary-session.tmux
}
function tnsuu(){
    tmux new-session -A -s Utrecht \; \
        source $HOME/.dotfiles/tmux/utrecht-session.tmux
}

function generalwriting(){
    cd $HOME/Utrecht/NS-TP551\ -\ Masters\ Thesis/Project\ Code/General\ Writing
    vim general-writing.main.tex
}
function notes(){
    cd $HOME/Utrecht/Gravitational\ Waves/Notes
    vim notes.main.tex
}
function paper(){
    cd $HOME/Utrecht/NS-TP551\ -\ Masters\ Thesis/Project\ Code/Paper\ Draft
    vim paper.thoughts.tex
}
function cdpaper(){
    cd $HOME/Utrecht/NS-TP551\ -\ Masters\ Thesis/Project\ Code/
}

function thesis(){
    cd $HOME/Utrecht/NS-TP551\ -\ Masters\ Thesis/Project\ Code/Thesis
    vim thesis.thoughts.tex
}
function resume(){
    cd $HOME/Utrecht/General/CV:Resume
    vim AltaCV-Template/riley-cv.tex
}

function imgshow(){
    # Requires imgcat
    rm -f .img.out
    imgcat $1 >> .img.out
    cat .img.out
}
alias dogs="imgshow $HOME/Pictures/dogs.jpeg"

function phdapp(){
    cp $HOME/Utrecht/General/Phd\ Applications/UU\ Multimessenger/Motivation/uu-mm-phd-motivation.pdf $HOME/Desktop
    cp $HOME/Utrecht/General/CV:Resume/AltaCV-Template/riley-cv.pdf $HOME/Desktop
}



function uuicloud(){
    rclone -PL sync "/Users/riley/Utrecht/NS-TP551 - Masters Thesis/Project Code/Paper Draft" ~/iCloud/Paper/Paper\ Draft/
    rclone -PL sync "/Users/riley/Utrecht/NS-TP551 - Masters Thesis/Project Code/Paper Archive" ~/iCloud/Paper/Paper\ Archive/
    rclone -PL sync "/Users/riley/Utrecht/NS-TP551 - Masters Thesis/Project Code/Meeting" ~/iCloud/Paper/Meeting
}
function uupload(){
#     echo "###### Syncing to Google Drive ######"
#     rclone -PL sync $HOME/Utrecht/ mydrive:Utrecht --filter-from $HOME/.dotfiles/rclone/filter-list.txt 
#     echo 
    echo "###### Syncing to UU Drive ######"
    rclone -PL sync $HOME/Utrecht/ uudrive:Utrecht --filter-from $HOME/.dotfiles/rclone/filter-list.txt 
    osascript "$HOME/.dotfiles/automator/sync-uu.scpt"
}
function uuonedrive(){
    rclone -PL sync $HOME/Utrecht/ uudrive:Utrecht --filter-from $HOME/.dotfiles/rclone/filter-list.txt 

}

# alias storage="osascript $HOME/.dotfiles/tmux/disk-usage.scpt"
function storage(){
    laptop_storage=$(osascript $HOME/.dotfiles/tmux/disk-usage.scpt) 

    echo "Internal: $laptop_storage"
    if [[ -d "/Volumes/Seagate 4TB" ]]; then
        seagate_storage=$(osascript $HOME/.dotfiles/tmux/seagate-usage.scpt)
        echo "External: $seagate_storage"
    fi 
}

function timeCurrent(){
    while true; do printf '%s\r' "$(date)"; done

}

function timeStopwatch(){
    start=$(date +%s)
    while true; do
        time="$(($(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
    done

}

function time_func()
{
   date2=$((`date +%s` + $1));
   date1=`date +%s`;
   date_finish="$(date --date @$(($date2)) +%T )"

   echo "Start at `date +%T`   Will finish at $date_finish"

    while [ "$date2" -ne `date +%s` ]; do
     echo -ne "     Since start: $(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)     Till end:  $(date -u --date @$(($date2 - `date +%s`)) +%H:%M:%S)\r";
     sleep 1
    done

    printf "\nTimer finished!\n"
    osascript -e beep
}
function test(){
    local verbose hours minutes seconds
    zparseopts -D -E -K -- \
        {v,-verbose}=verbose \
        {h,-hours}:=hours \
        {m,-mins,-minutes}:=minutes \
        {s,-secs,-seconds}:=seconds
    
    if [[ -n ${verbose} ]]; then
        echo ${verbose}
        echo "Test Verbose Statement"
    fi

    if (( ${+1} )); then
        total_seconds=$1
    else
        total_seconds=0
    fi
    if (( $#hours )); then
        hours=${(q+)hours[-1]}
        total_seconds=$(( $total_seconds + ( $hours*3600 ) ))
        echo "hours = $hours"
    fi
    if (( $#minutes )); then
        minutes=${(q+)minutes[-1]}
        total_seconds=$(( $total_seconds + ( $minutes*60 ) ))
        echo "minutes = $minutes"
    fi
    if (( $#seconds )); then
        seconds=${(q+)seconds[-1]}
        total_seconds=$(( $total_seconds + $seconds ))
        echo "seconds = $seconds"
    fi
    print -rC1 -- "Total Time in Seconds: $total_seconds"

    for i in `seq $total_seconds -1 1` ; do echo -ne "\r$i " ; sleep 1 ; done
    #
#     start="$(( $(date '+%s') + $total_seconds))"
#     while [ $start -ge $(date +%s) ]; do
#         time="$(( $start - $(date +%s) ))"
#         echo -ne "$(date -ju -f %s $(($date1 - date +%s)) +%H:%M:%S)\r"
#         sleep 0.1
#     done
}

# function timeCountdown(){
#     start="$(( $(date '+%s') + $1))"
#     while [ $start -ge $(date +%s) ]; do
#         time="$(( $start - $(date +%s) ))"
#         echo -ne "$(date -ju -f %s $(($date1 - date +%s)) +%H:%M:%S)\r"
#         sleep 0.1
#     done
# }
function doiname(){
    echo $2
    filename=$(python $HOME/Coding/Python/SchemanticScholor/schpapers.py "$2")
    mv "$1" "$filename"
}



function arxivname(){
    for x in $@; do
        echo $x
        arxivlink="${x%.*}"
        filename=$(python $HOME/Coding/Python/arXiv-scrapper/arXiv-metadata.py $arxivlink)
        mv "$x" "$filename"
    done
}

function ZoteroArchive(){
    for x in $@; do
        echo $x
        IFS=$'\n' arr=($(python $HOME/Coding/Python/ZoteroParser/ZoteroRename.py $x))
        filename=${arr[1]}
        fileLocation=${arr[2]}
        echo $fileLocation
        cp "$fileLocation" "$filename"
    done
}
# function arxivdownload(){
#     for x in $@; do
#         arxivlink="$x"
#         python $HOME/Coding/Python/arXiv-scrapper/arXiv-download.py "$arxivlink"
#         (cd "$HOME/Downloads" && arxivname "$arxivlink.pdf")
#     done
# }


function clock(){
    hidecursor
    while :; do 
        printf '\r%s ' "$(date +%r)"
        sleep 1 
    done
}


function paperArchive(){
    zsh $HOME/Coding/Zsh/paperArchive.sh
}

# setopt localoptions rmstarsilent
# rm -rf $ZipLocation/*


function checkInput(){
    if (( ${+1} )); then
        echo $1
    else
        echo "No input variable found!"
        return
    fi
    echo "Done"
}

function runDiff(){
    setopt localoptions rmstarsilent
    DiffLocation=$HOME/Utrecht/NS-TP551\ -\ Masters\ Thesis/Project\ Code/Paper\ Draft/Diff
    rm -rf $DiffLocation
    mkdir $DiffLocation

    here=$(pwd)
    cd $DiffLocation

    ZipLocation=$HOME/Utrecht/NS-TP551\ -\ Masters\ Thesis/Project\ Code/Paper\ Archive


    if (( ${+1} )); then
        OldZip=$(basename $1)
    else
        echo "Using .archive_recent"
        OldZip=$(<$ZipLocation/.archive_recent)
    fi
    echo "Old files: $OldZip"

    New=/Users/riley/Utrecht/NS-TP551\ -\ Masters\ Thesis/Project\ Code/Paper\ Draft/paper.tex 
    cleantex $New
#     echo $New
#     echo "$ZipLocation/$OldZip" 
#     echo $ZipLocation/$OldZip
    zsh $HOME/Coding/Zsh/latexdiff.sh $ZipLocation/$OldZip $New


    cd $here
}
function newTexProj(){
    zsh $HOME/Coding/Zsh/new-latex-project.sh $1
}
