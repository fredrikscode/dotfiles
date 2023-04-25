# Plugins
autoload -Uz compinit promptinit
compinit
promptinit

# Unsure of title
zstyle ':completion:*' menu select # Autocompletion with arrow-key interface

# Keybinds
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '\e[3~' delete-char
bindkey '\e[2~' overwrite-mode
bindkey '\e[5~' history-beginning-search-backward
bindkey '\e[6~' history-beginning-search-forward

zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
#zsh_add_file "zsh-prompt"