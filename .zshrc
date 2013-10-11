#------------------------------------------------------------------------------------------#
# environment variables                                                                    #
##------------------------------------------------------------------------------------------#
export LANG=ja_JP.UTF-8
#export LANG=ja_JP.EUC-JP
export PATH=~/bin:/usr/local/bin:$PATH:/sbin:/usr/sbin:/usr/local/mysql/bin:/Applications/android-sdk-mac_x86/tools
export PATH=/usr/local/Cellar/ruby/2.0.0-p0/bin:$PATH

## enviroment variables for zsh
autoload -Uz colors
colors

# you can use black:red:green:yellow:blue:magenta:cyan:white
PS1='%{$fg[cyan]%}[%n :%~%]]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '

HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

#---[display git branch]---------------------------#
function rprompt-git-current-branch {
        local name st color

        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
        if [[ -z $name ]]; then
                return
        fi
        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=${fg[green]}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                color=${fg[yellow]}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=${fg_bold[red]}
        else
                color=${fg[red]}
        fi

        # %{...%} ??????????????????????????????????????????????????????????
        # ???????????????????????????ΰ???????????
        echo "%{$color%}$name%{$reset_color%}"
}

# ????????????????????????????????????????????????????????????
setopt prompt_subst

RPROMPT='[`rprompt-git-current-branch`]'

#------------------------------------------------------------------------------------------#
# aliases                                                                                  #
#------------------------------------------------------------------------------------------#
alias tm='tmux'
alias grep='grep --color'
alias svn=colorsvn

alias tailp='tail -f /var/log/php.log'
alias taila='tail -f /var/log/apache/access.log'
alias taile='tail -f /var/log/apache/error.log'
alias tree='nocorrect tree'

#------------------------------------------------------------------------------------------#
# bindkeys                                                                                 #
#------------------------------------------------------------------------------------------#
bindkey -e
bindkey '\C-u' undo

## cd .. like dired of Emacs
function cdup() {
   echo
   cd ..
   zle reset-prompt
}
zle -N cdup
#bindkey '\^' cdup

#cd + ls
function chpwd() { ls }

#------------------------------------------------------------------------------------------#
# zsh configuration                                                                        #
#------------------------------------------------------------------------------------------#
limit coredumpsize 102400
unsetopt promptcr
setopt prompt_subst
setopt notify
setopt nobeep
setopt rec_exact
setopt long_list_jobs
setopt list_types
setopt auto_resume
setopt auto_list
setopt hist_ignore_dups
setopt autopushd
setopt pushd_minus
setopt extended_glob
setopt auto_menu
setopt no_list_beep
setopt pushd_ignore_dups
setopt no_nomatch
setopt extended_history
setopt equals
setopt magic_equal_subst
setopt hist_verify
setopt numeric_glob_sort
setopt print_eight_bit
setopt complete_in_word # ZSH FAQ: 4.4
setopt complete_aliases
setopt share_history
unsetopt ignore_eof
unsetopt hash_cmds
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt auto_param_keys
setopt auto_param_slash
setopt auto_remove_slash
setopt NO_beep
setopt correct

autoload -U compinit
compinit
setopt auto_pushd

#------------------------------------------------------------------------------------------#
# functions                                                                                #
#------------------------------------------------------------------------------------------#
function history-all { history -E 1 }
function histail { history -E 1 | grep $1 | tail }


#------------------------------------------------------------------------------------------#
# with screen                                                                              #
# http://nijino.homelinux.net/diary/200206.shtml#200206140                                 #
#------------------------------------------------------------------------------------------#
preexec () {
  echo -ne "\ek${1%% *}\e\\"
}

preexec () {
  [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"
}

#############################################################
# ssh-agent
# http://www.snowelm.com/~t/doc/tips/20030625.ja.html
echo -n "ssh-agent: "
source ~/.ssh-agent-info
ssh-add -l >&/dev/null
#if [ $? == 2 ] ; then # bash
if (( $? == 2 )) ; then # zsh
    echo -n "ssh-agent: restart...."
    ssh-agent >~/.ssh-agent-info
    source ~/.ssh-agent-info
fi
if ssh-add -l >&/dev/null ; then
    echo "ssh-agent: Identity is already stored."
else
    ssh-add
fi
eval "$(rbenv init -)"
