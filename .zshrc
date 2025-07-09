# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
setopt SHARE_HISTORY        # share history between all sessions
setopt HIST_IGNORE_SPACE    # don't record commands that start with a space
setopt INC_APPEND_HISTORY   # write to $HISTFILE immediately, not just when exiting the shell
setopt HIST_IGNORE_ALL_DUPS # remove old duplicates from history
setopt HIST_VERIFY          # don't execute immediately when picking from history
SAVEHIST=$HISTSIZE          # and also store all these entries in our $HISTFILE

alias cat="bat"
alias ls="eza -l --no-user"
alias grep="grep --color=auto"
alias vim="nvim"
alias hypr="vim ~/.config/hypr/hyprland.conf"
alias diff='diff --color=auto'
alias ip='ip -color=auto'
alias p=' ps aux | grep'
alias g='git'
alias ..=' cd ..; ls'


zmodload -i zsh/complist
_comp_options+=(globdots)   # include hidden files
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.


# Use select menu for completions
zstyle ':completion:*' menu select
# Autocomplete options when completing a '-'
zstyle ':completion:*' complete-options true
# Style group names a little nicer
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}↓ %d %f'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d -- \e[00;00m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found -- \e[00;00m'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
# Group completion results by type
zstyle ':completion:*' group-name ''

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# fault tolerance
zstyle ':completion:*' completer _complete _correct _approximate
# (1 error on 3 characters)
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH_CACHE"

zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit && compinit

FZF_CONFIG=~/.fzf.sh
if [[ -x "$(command -v fzf)" ]] && [[ -f "$FZF_CONFIG" ]]; then
  source "$FZF_CONFIG"
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
