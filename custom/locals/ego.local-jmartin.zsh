alias detach='hdiutil detach /Users/jmartin/.downloads'
alias attach='hdiutil attach -stdinpass /Users/jmartin/.downloads.sparsebundle -mountpoint /Users/jmartin/.downloads -nobrowse'
alias detach2='hdiutil detach /Users/jmartin/.downloads00'
alias attach2='hdiutil attach -stdinpass /Volumes/home/.downloads00.sparsebundle -mountpoint /Users/jmartin/.downloads00 -nobrowse'
alias publish="ssh -t sc '~/scripts/publishmt.sh'"
alias log="~/scripts/logtodayone.rb"

function psync {
        attach
        rsync -rvc jmartin@mneme6.thosemartins.family:.downloads/finis/ .downloads/
}

function dailylog {
  /Users/jmartin/scripts/logtodayone.rb < ~/Dropbox/Joe/dailylog.txt
  sleep 10
  cat /dev/null > ~/Dropbox/Joe/dailylog.txt
}

function quiet {
  export HISTFILE=/dev/null
}
