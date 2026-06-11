# --- Locale & editor ---
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export VISUAL=vim
export PAGER=less

# --- Path ---
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# --- History ---
export HISTCONTROL=ignoredups
export HISTSIZE=200
export HISTFILESIZE=200

# --- Prompt (colored) ---
export PS1='\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]\$ '

# --- Aliases ---
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lll='ls -alh'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias dfh='df -h'
alias duh='du -sh * | sort -h'
alias cpuinfo='lscpu | egrep "Model name|CPU\(s\):"'
alias meminfo='free -h'
alias osinfo='cat /etc/os-release'

# Per-host overrides
[ -r "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"
