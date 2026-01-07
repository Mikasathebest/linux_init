# ~/.cshrc for Ubuntu 24.04 tcsh/csh

# --- Basic settings ---
set history      = 200
set savehist     = (200 merge)
set autolist     # list choices on ambiguous completion
set autorehash   # auto-rehash PATH for new commands
set noclobber    # prevent '>' from overwriting files
set ignoreeof    # avoid accidental logout with Ctrl-D

# --- Locale & editor ---
setenv LANG      en_US.UTF-8
setenv LC_ALL    en_US.UTF-8
setenv EDITOR    vim
setenv VISUAL    vim
setenv PAGER     less

# --- Path (Ubuntu-friendly) ---
set path = ( \
    $HOME/bin \
    /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin \
)

# If you use snaps or custom toolchains, add them here, e.g.:
# set path = ( /snap/bin $path )

# --- Prompt (colored, shows host and cwd) ---
# Requires tcsh; plain csh will ignore colors.
set prompt = "%{\033[1;32m%}%n@%m%{\033[0m%}:%{\033[1;34m%}%~%{\033[0m%}%# "

# Show exit status of last command if non-zero
alias precmd 'if ( $status != 0 ) echo "Exit status: $status"'

# --- Useful aliases ---
alias ls      'ls --color=auto'
alias ll      'ls -lh'
alias la      'ls -A'
alias lll     'ls -alh'
alias ..      'cd ..'
alias ...     'cd ../..'
alias grep    'grep --color=auto'
alias dfh     'df -h'
alias duh     'du -sh * | sort -h'

# Quick system info
alias cpuinfo  'lscpu | egrep "Model name|CPU\(s\):"'
alias meminfo  'free -h'
alias osinfo   'cat /etc/os-release'

# --- SSH and history niceties ---
setenv HISTCONTROL  ignoredups
setenv HISTSIZE     200

# --- Per-host or private overrides ---
if ( -r $HOME/.cshrc.local ) then
    source $HOME/.cshrc.local
endif
