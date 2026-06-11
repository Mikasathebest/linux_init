# --- Basic settings ---
set history      = 200
set savehist     = 200
set autolist
set autorehash
set noclobber
set ignoreeof

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

# --- Prompt (colored, shows host and cwd) ---
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

# --- Per-host or private overrides ---
if ( -r $HOME/.cshrc.local ) then
    source $HOME/.cshrc.local
endif
