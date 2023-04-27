# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

alias ..="cd .."
alias ...="cd ../.."

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias cu="sudo pacman -Syu"
alias i="sudo pacman -S"
alias r="sudo pacman -R"
alias q="sudo pacman -Q"
alias yi="yay -S"
alias yr="yay -R"
alias yq="yay -Q"

alias v="nvim"

# Unsure of title
zstyle ':completion:*' menu select # Autocompletion with arrow-key interface

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
