# .bashrc

# Aliases
alias vim="nvim"
alias v="nvim"
alias t="tmux"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Customize PS1
PS1='\[\e[32m\]\u@\h \[\e[34m\]\w\[\e[0m\] $ '

# Set default editor
export EDITOR=nvim

# Autocompletion for dotfiles alias
source /usr/share/bash-completion/completions/git
__git_complete dotfiles __git_main
