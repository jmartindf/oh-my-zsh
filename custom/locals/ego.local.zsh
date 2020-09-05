alias econv='/Applications/calibre.app/Contents/MacOS/ebook-convert'
alias fixbrew='sudo chown $(whoami):admin /usr/local && sudo chown -R $(whoami):admin /usr/local'

orient() { mediainfo $1 | grep Rotation | sed 's/[^0-9]*//g' }
encode() { name=`basename $1 .mov`; ~/Applications/HandBrakeCLI -i "$name.mov" -o "$name.m4v" --preset="iPad" --rotate=$2 }

function shrink() {
  rot=`orient "$1"`
  if (( $rot == 270 )); then
    opt=7
  elif (( $rot == 90 )); then
    opt=4
  elif (( $rot == 180 )); then
    opt=3
  else
    opt=0
  fi
  encode $1 $opt
}

function drwho() {
  incr=$1
  zmv -n 's(*)e(*)p([0-9]##) (*).avi' '/Volumes/media/Entertainment/TV/Doctor Wh1 (1963)/Season $1/Doctor Who - s$1e${(l(2)(0))$(($3+$incr))} - $4.avi'
  print "Do it? "
  read cont
  if [[ $cont = "y" ]]; then
    zmv 's(*)e(*)p([0-9]##) (*).avi' '/Volumes/media/Entertainment/TV/Doctor Wh1 (1963)/Season $1/Doctor Who - s$1e${(l(2)(0))$(($3+$incr))} - $4.avi'
  fi
}

export UNISONLOCALHOSTNAME='ego'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
source ~/.local_virtualenv
