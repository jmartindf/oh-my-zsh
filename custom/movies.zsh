alias -g omov="'/Volumes/entertainment/Home Theater/Movies/Ours'"
alias -g rmov="'/Volumes/entertainment/Home Theater/Movies/Not Ours'"
function sortfeatures() {
	autoload zmv
	if test -d "${1}"
		then
		cd "${1}"
		if test -n "$(find . -maxdepth 1 -name '*-featurette.mkv' -print -quit)"
		then
			mkdir -p Featurettes
			zmv '(*)-featurette.mkv' 'Featurettes/$1.mkv'
		fi
		if test -n "$(find . -maxdepth 1 -name '*-behindthescenes.mkv' -print -quit)"
		then
			mkdir -p "Behind the Scenes"
			zmv '(*)-behindthescenes.mkv' 'Behind the Scenes/$1.mkv'
		fi
		if test -n "$(find . -maxdepth 1 -name '*-deleted.mkv' -print -quit)"
		then
			mkdir -p "Deleted Scenes"
			zmv '(*)-deleted.mkv' 'Deleted Scenes/$1.mkv'
		fi
		if test -n "$(find . -maxdepth 1 -name '*-interview.mkv' -print -quit)"
		then
			mkdir -p Interviews
			zmv '(*)-interview.mkv' 'Interviews/$1.mkv'
		fi
		if test -n "$(find . -maxdepth 1 -name '*-scene.mkv' -print -quit)"
		then
			mkdir -p Scenes
			zmv '(*)-scene.mkv' 'Scenes/$1.mkv'
		fi
		if test -n "$(find . -maxdepth 1 -name '*-short.mkv' -print -quit)"
		then
			mkdir -p Shorts
			zmv '(*)-short.mkv' 'Shorts/$1.mkv'
		fi
		if test -n "$(find . -maxdepth 1 -name '*-trailer.mkv' -print -quit)"
		then
			mkdir -p Trailers
			zmv '(*)-trailer.mkv' 'Trailers/$1.mkv'
		fi
		cd ..
	fi
}
function movemovie() {
	if test -d "${1}"
		then
		rsync -vrat --remove-source-files "${1}" omov
	fi
}
function moverental() {
	if test -d "${1}"
		then
		rsync -vrat --remove-source-files "${1}" rmov
	fi	
}
function finishmovie() {
	sortfeatures "${1}"
	movemovie "${1}"
}
function finishrental() {
	sortfeatures "${1}"
	moverental "${1}"
}
