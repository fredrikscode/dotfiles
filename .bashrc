#!/bin/bash

# Miscellaneous
alias c='clear'
alias cp='cp -i' # Confirm before overwriting
alias df='df -h'
alias free='free -m'
alias grep='grep --color=auto'
alias sb='source ~/.bashrc'

# List files/directories
alias l.='exa -a | egrep "^\."'
alias ls='exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'

# Directory navigation
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

### Package management
## Search
function fp() {
  if [ $UID -ne 0 ]; then
    alias fp='sudo apt-cache search'
  else
    alias fp='apt-cache search'
  fi   
}

## Install
function i() {
  if [ $UID -ne 0 ]; then
    alias i='sudo apt -y install'
  else
    alias i='apt -y install'
  fi   
}

## Update
function update() {
  if [ $UID -ne 0 ]; then
    alias update='sudo apt -y update'
  else
    alias update='apt -y update'
  fi
}

## Upgrade
function upgrade() {
  if [ $UID -ne 0 ]; then
    alias update='sudo apt -y upgrade'
  else
    alias update='apt -y upgrade'
  fi
}

# Archive extraction
function ex() {
  if [ -f "$1" ]; then
    case $1 in
      *.tar.bz2)    tar xjf $1 ;;
      *.tar.gz)     tar xzf $1 ;;
      *.bz2)        bunzip2 $1 ;;
      *.rar)        unrar x $1 ;;
      *.gz)         gunzip $1 ;;
      *.tar)        tar xf $1 ;;
      *.tbz2)       tar xjf $1 ;;
      *.tgz)        tar xzf $1 ;;
      *.zip)        unzip $1 ;;
      *.Z)          uncompress $1 ;;
      *.7z)         7z x $1 ;;
      *.deb)        ar x $1 ;;
      *.tar.xz)     tar xf $1 ;;
      *.tar.zst)    unzstd $1 ;;
      *)            echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Git
function g() {
  case $* in
    clone ) command terraform init ;; 
    apply ) command terraform apply --auto-approve ;; 
    destroy ) command terraform destroy --auto-approve ;; 
    * ) return ;;
  esac
}

# Terraform
function t() {
  case $* in
    i ) command terraform init ;; 
    a ) command terraform apply --auto-approve ;; 
    d ) command terraform destroy --auto-approve ;; 
    * ) return ;;
  esac
}