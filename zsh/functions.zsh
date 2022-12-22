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
        ./"$output_file"
    else
        echo "Error Code 1: Not a C file"
        echo "did you mean: $filename.c ?"
    fi 
}
function cleantex(){
    local dir=$(dirname "$1")
    if [[ -f "$dir/.clean_tex.sh" ]]; then # Check if the file exists
        zsh "$dir/.clean_tex.sh"
    fi
    filename="${1%.*}"
    rm -f "$filename.aux" "$filename.fls" "$filename.log" "$filename.toc" "$filename.out" "$filename.fdb_latexmk" "$filename.synctex.gz" ".latexrun*"  "$filename.bcf" "$filename.blg" "$filename.run.xml" "pdfa.xmpi"
}

function opentexpdf(){
    local dir=$(dirname "$1")
    if [[ -f "$dir/.pdf_open.sh" ]]; then # Check if the file exists
        zsh "$dir/.pdf_open.sh"
    else
        filename="${1%.*}"
        open "$filename.pdf"
    fi
}
function touchpreview(){
    filename="${1%.*}"
    open /System/Applications/Preview.app 
    open /Applications/iTerm.app 
}

function opencurrenttexmaker(){
    filename="${1%.*}"
    open /Applications/texmaker.app "$filename.tex"
}
function cdtofile(){
    #file_directory=$(dirname $1) # Not relative
    directory=$(pwd)
    echo $directory
    cd $directory
}


function touchpreview(){
    open /System/Applications/Preview.app
    open /Applications/iTerm.app
}

function runtex(){
    #latexmk -lualatex --pdf -quiet $1
    #latexmk -lualatex -silent -latexoption="-synctex=1" $1
    local dir=$(dirname "$1")
    if [[ -f "$dir/.tex_compile.sh" ]]; then # Check if the file exists
        echo "File Exisits!"
        zsh "$dir/.tex_compile.sh"
    else
        echo "File Does Not Exisit!"
        latexmk -lualatex -quiet  $1
        filename="${1%.*}"
    fi
}

function run-script(){
    FILE_EXT="${1##*\.}"
    if [[ $FILE_EXT == 'sh' ]]; then
        /bin/zsh $1
    elif [[ $FILE_EXT == 'py' ]]; then
        /usr/local/bin/python3.9 $1
    elif [[ $FILE_EXT == 'scpt' ]]; then
        osascript $1
    elif [[ $FILE_EXT == 'c' ]]; then
        runc $1 
    elif [[ $FILE_EXT == 'tex' ]]; then
        runtex $1 
    else
        echo "Not python, applesctipy or zsh file, please edit run-script in zshrc"
        echo "$1"
    fi
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
    FILE_EXT="${1##*\.}"
    filename="${1%.*}"
    if [[ $FILE_EXT == '.vimrc' || $filename == 'vimrc' ]]; then
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

function pdfmerge(){ 
    gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$1" "${@:2}"
}
function pngmerge(){
    # Install imagemagick first
    convert ${@:2} $1
}

function tns(){
    tmux new-session -A -s $1 \; \
        source $HOME/.dotfiles/tmux/primary-session.tmux
}

function thesis(){
    cd $HOME/Utrecht/NS-TP551\ -\ Masters\ Thesis/Latex/General\ Writing
    vim general-writing.main.tex
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


