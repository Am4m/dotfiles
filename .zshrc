# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/amam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias cat="bat"
alias ls="eza -l --no-user"
alias grep="grep --color=auto"
alias vim="nvim"
alias hypr="vim ~/.config/hypr/hyprland.conf"

eval "$(starship init zsh)"
