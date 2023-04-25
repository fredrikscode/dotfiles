# Plugins
autoload -Uz compinit promptinit
compinit
promptinit

# Unsure of title
zstyle ':completion:*' menu select # Autocompletion with arrow-key interface

zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-keybinds"