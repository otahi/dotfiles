# .zshrc

local BLACK=$'%{e[1;30m%}'
local RED=$'%{e[1;31m%}'
local GREEN=$'%{e[1;32m%}'
local YELLOW=$'%{e[1;33m%}'
local BLUE=$'%{e[1;34m%}'
local PURPLE=$'%{e[1;35m%}'
local AQUA=$'%{e[1;36m%}'
local WHITE=$'%{e[1;37m%}'
local DEFAULT=$'%{e[1;m%}'

# set prompt
autoload colors
colors
case ${UID} in
0)
    PROMPT="%B%{${fg[cyan]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[cyan]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[cyan]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
*)
    PROMPT="%{${fg[cyan]}%}[${USER}@${HOST%%.*} %1~]%(!.#.$) %{${reset_color}%}%b"
    PROMPT2="%{${fg[cyan]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[cyan]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
esac

# alias
alias mv="mv -i"
alias rm="rm -i"
alias tree="tree -C"

# complete
autoload -U compinit
compinit
# complete in –prefix=/usr like situation
setopt magic_equal_subst

# make a list when multiple completion
setopt auto_list
# complete when tab
setopt auto_menu
# auto param peer
setopt auto_param_keys

# competion in sudo
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# colorize like ls in completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ignore C-s, C-q
setopt NO_flow_control
setopt COMPLETE_IN_WORD

# ignore beep 
setopt nobeep
setopt nolistbeep

## command history configuration
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt share_history        # share command history data
setopt append_history
setopt extended_history     #timestump

# ls when cd 
function chpwd() { ls }

# pager
export PAGER="less"

# color in incremental search
zle_highlight=(default:fg=white isearch:bold,fg=red)

# loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# load proxy settings
[ -f ~/.proxy ] && source ~/.proxy
