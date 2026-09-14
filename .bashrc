# ~/.bashrc
# Config by ami-chuu

# If not running interactively, do nothing.
case $- in *i*) ;; *) return ;; esac

# ── Environment
export EDITOR="nvim"
export VISUAL="$EDITOR"
export PATH="$HOME/.local/bin:$PATH"
export PAGER=less
export LESS='-R'

# ── History
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T '
HISTIGNORE="ls:cd:pwd:exit:clear:history:bg:fg"
shopt -s histappend
# Append each command to the history file as it is entered.
PROMPT_COMMAND='history -a'

# ── Shell options
shopt -s checkwinsize
shopt -s globstar
shopt -s extglob
shopt -s autocd 2>/dev/null
shopt -s cdspell
# Programmable completion.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ── Key bindings
bind 'set completion-ignore-case on' 2>/dev/null
bind 'set show-all-if-ambiguous on' 2>/dev/null
bind 'set colored-stats on' 2>/dev/null
bind '"\e[A": history-search-backward' 2>/dev/null
bind '"\e[B": history-search-forward' 2>/dev/null
bind '"\e[1;5C": forward-word' 2>/dev/null
bind '"\e[1;5D": backward-word' 2>/dev/null
bind '"\e[H": beginning-of-line' 2>/dev/null
bind '"\e[F": end-of-line' 2>/dev/null
bind '"\e[3~": delete-char' 2>/dev/null

# ── Prompt
parse_git_branch() {
  git branch 2>/dev/null | sed -n 's/^\* \(.*\)/ (\1)/p'
}
PS1='\[\e[36m\]\u@\h\[\e[0m\]:\[\e[33m\]\w\[\e[32m\]$(parse_git_branch)\[\e[0m\]\$ '

# ── Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lh'
alias la='ls -lAh'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h'
alias free='free -h'
