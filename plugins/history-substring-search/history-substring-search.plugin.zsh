0=${(%):-%N}
source ${0:A:h}/history-substring-search.zsh


# Bind terminal-specific up and down keys
# Bind in both emacs and vi modes so it works in both, and is not
# sensitive to whether this is loaded before or after the vi-mode plugin
if [[ -n "$terminfo[kcuu1]" ]]; then
  bindkey -M emacs "$terminfo[kcuu1]" history-substring-search-up
  bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up
fi
if [[ -n "$terminfo[kcud1]" ]]; then
  bindkey -M emacs "$terminfo[kcud1]" history-substring-search-down
  bindkey -M viins "$terminfo[kcud1]" history-substring-search-down
fi

