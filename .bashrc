#
# ~/.bashrc
#
fastfetch --logo none
export "MICRO_TRUECOLOR=1"
eval "$(starship init bash)"
eval $(thefuck --alias)
eval $(thefuck --alias fk)
eval "$(fzf --bash)"
eval "$(zoxide init bash)"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="-preview 'eza -tree --color=always {} | head -200'"

_fzf_comprun() {
	local command=$1
	shift

	case "$command" in
	  cd)	 		fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
	  export|unset) fzf --preview "eval 'echo \$' {}" "$@" ;;
	  ssh) 			fzf --preview 'dig {}' "$@" ;;
	  *) 			fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
	esac
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
gbr=$(git branch --show-current 2>/dev/null)
alias gbr='git branch --show-current 2>/dev/null'
PS1='\n\w\[\e[38;5;39;1m\]$gbr\n\[\e[0;92;5m\]>\[\e[0m\] '
export PATH=$PATH:/home/ahmadinne/.spicetify

#aliases
alias ff='clear; fastfetch --logo none'
alias m='micro'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias shutdown='poweroff'
alias suspend='systemctl suspend'
alias lock='hyprlock'
alias lf='eza --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias cd='z'
