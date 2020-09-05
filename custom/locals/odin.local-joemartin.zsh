MOUNTPOINT="/Users/joemartin/downloads2"

function attach() {
  hdiutil attach -mountpoint "${MOUNTPOINT}" -nobrowse /Users/joemartin/.downloads.sparseimage
}

function detach() {
	hdiutil detach "${MOUNTPOINT}"
}
