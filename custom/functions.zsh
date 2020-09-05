function sc {
  ruby -e 'puts ARGV[0].capitalize' "$1"
}

function mobi {
  input=$1;
  shift;
  base=`basename "${input}" .prc`;
  mobi2mobi "${input}" --outfile "${base}.mobi" "$@";
}
