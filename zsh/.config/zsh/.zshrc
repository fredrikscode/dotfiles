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

# Functions
function check_package() {
    if [ $# -eq 0 ]
    then
        ehco "No argument supplied"
        exit 1
    fi

    package=$1

    # Check if the package is installed locally
    if pacman -Q $package > /dev/null 2>&1
    then
        echo -e "Locally \033[32m✓\033[0m"
    else
        echo "Locally \033[31m✘\033[0m"
    fi

    # Check if the package is available in any of the available repositories
    package_info=$(pacman -Ss "^$package$" | awk '/^community\//{print $2}' | xargs pacman -Si 2>/dev/null)
    if [ -n "$package_info" ]
    then
        remote_version=$(echo "$package_info" | awk '/^Version/{print $3}' | tail -n 1)
        if [ -n "$remote_version" ]
        then
            echo -e "Remote \033[32m✓\033[0m (version: $remote_version)"
        else
            echo "Remote \033[31m✘\033[0m"
        fi
    else
        echo "Remote \033[31m✘\033[0m"
    fi
}

# Aliases
alias src="source $HOME/.config/zsh/.zshrc"

alias ..="cd .."
alias ...="cd ../.."

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias u="sudo pacman -Syu"
alias fp="check_package"
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
