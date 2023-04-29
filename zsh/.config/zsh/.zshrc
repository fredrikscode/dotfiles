# Enable Powerlevel10k instant prompt. Should stay close to the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

function plugin-load {
  local repo plugdir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

repos=(
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
)

plugin-load $repos

autoload -Uz promptinit vcs_info
precmd() { vcs_info }
promptinit

export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

source $HOME/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '\e[3~' delete-char
bindkey '\e[2~' overwrite-mode
bindkey '\e[5~' history-beginning-search-backward
bindkey '\e[6~' history-beginning-search-forward

alias src="source $HOME/.config/zsh/.zshrc"
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls --color -l -h"
alias grep="grep -n --color"
alias mkdir="mkdir -pv"
alias c="clear -x"
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
alias bye="systemctl poweroff"
alias boot="systemctl reboot"
alias sus="systemctl suspend"
alias hib="systemctl hibernate"

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
