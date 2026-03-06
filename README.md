# linux_init

Centralized shell and editor configuration for all my machines across different operating systems.

## Project Structure

```
linux_init/
├── macbook/                # macOS (zsh)
│   ├── zshrc_template      #   oh-my-zsh config, aliases, lazy-loaders
│   ├── quick_setup.sh      #   one-command bootstrap
│   └── README.md
├── rocky8/                 # Rocky Linux 8 (tcsh) — NV work machines
│   ├── cshrc_template      #   NV global env, Perforce, LSF
│   ├── aliases_nv_sc_template  # NV work aliases (scratch, p4, qsub)
│   ├── quick_setup.sh      #   one-command bootstrap
│   └── README.md
├── ubuntu/                 # Ubuntu 22/24 (tcsh)
│   ├── cshrc_template      #   clean defaults, colored prompt, aliases
│   ├── quick_setup.sh      #   one-command bootstrap
│   └── README.md
├── vimrc_template          # shared vim config (all platforms)
└── README.md               # this file
```

## Quick Start

Clone this repo onto a new machine and run the matching setup script:

```bash
git clone <repo-url>
cd linux_init
```

| Machine        | Command                        |
|----------------|--------------------------------|
| macOS          | `bash macbook/quick_setup.sh`  |
| Rocky Linux 8  | `bash rocky8/quick_setup.sh`   |
| Ubuntu         | `bash ubuntu/quick_setup.sh`   |

Each script will:
1. **Detect** the current OS and abort if it doesn't match
2. **Back up** existing rc files with a timestamp (e.g. `~/.zshrc.bak_20260306_143000`)
3. **Copy** the templates to `~/`

## What Gets Installed

| OS       | Shell RC              | Vim RC       |
|----------|-----------------------|--------------|
| macOS    | `~/.zshrc`            | `~/.vimrc`   |
| Rocky 8  | `~/.cshrc`            | `~/.vimrc`   |
| Ubuntu   | `~/.cshrc`            | `~/.vimrc`   |

## Adding a New OS

1. Create a new directory (e.g. `fedora/`)
2. Add your shell template (e.g. `bashrc_template`)
3. Copy and adapt one of the existing `quick_setup.sh` scripts
4. Add a `README.md` describing the environment
