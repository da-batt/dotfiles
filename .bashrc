# .bashrc

alias homelab-on="wol dc:4a:3e:78:a8:6d"
alias vim="nvim"
alias vi="nvim"
alias nv="nvim"
alias dotfiles='/urs/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
