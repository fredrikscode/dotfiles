

# Theme
source $HOME/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# Plugins
autoload -Uz compinit promptinit vcs_info
precmd() { vcs_info }
compinit
promptinit

# Exports
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

# Keybinds
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '\e[3~' delete-char
bindkey '\e[2~' overwrite-mode
bindkey '\e[5~' history-beginning-search-backward
bindkey '\e[6~' history-beginning-search-forward

# Aliases
alias src="source $HOME/.config/zsh/.zshrc"

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias cu="sudo yum check-update"
alias i="sudo pacman -S"
alias r="sudo pacman -R"
alias q="sudo pacman -Q"
alias yi="yay -S"
alias yr="yay -R"
alias yq="yay -Q"

alias v="nvim"

# Unsure of title
zstyle ':completion:*' menu select # Autocompletion with arrow-key interface


