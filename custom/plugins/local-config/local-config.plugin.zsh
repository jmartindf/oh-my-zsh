function find_configs() {
	USERHOSTCONFIG="${ZSH_CUSTOM}/locals/${HOST}-${USER}.zsh"
	USERCONFIG="${ZSH_CUSTOM}/locals/${USER}.zsh"
	HOSTCONFIG="${ZSH_CUSTOM}/locals/${HOST}.zsh"

	if [[ -a "${USERCONFIG}" ]]; then
		source "${USERCONFIG}"
	fi
	if [[ -a "${HOSTCONFIG}" ]]; then
		source "${HOSTCONFIG}"
	fi
	if [[ -a "${USERHOSTCONFIG}" ]]; then
		source "${USERHOSTCONFIG}"
	fi
}

find_configs
