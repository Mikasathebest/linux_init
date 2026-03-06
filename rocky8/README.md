# Rocky Linux 8 Setup

Configuration templates for NVIDIA xterm/container work machines running Rocky Linux 8.

## Environment

```
> lsb_release -a
Distributor ID: Rocky
Description:    Rocky Linux release 8.9 (Green Obsidian)
```

## Shell & Editor

| Component | Tool  |
|-----------|-------|
| Shell     | tcsh  |
| Editor    | vim   |

## Templates

| File                      | Installs to | Description |
|---------------------------|-------------|-------------|
| `cshrc_template`          | `~/.cshrc`  | NV global env, RBS paths, Perforce config, LSF, locale settings |
| `aliases_nv_sc_template`  | (manual)     | Work aliases: scratch dirs, p4 shortcuts, qsub helpers, tmux |
| `../vimrc_template`       | `~/.vimrc`  | Shared vim config (syntax, keybindings, file templates) |

## Quick Setup

```bash
git clone <repo-url> && cd linux_init
bash rocky8/quick_setup.sh
```

The script will:
1. Verify you are running on Rocky Linux 8 (checks `/etc/os-release`)
2. Back up any existing `~/.cshrc` and `~/.vimrc` (with timestamp)
3. Copy the templates into place

After running, reload with:
```tcsh
source ~/.cshrc
```

## Optional: Work Aliases

The `aliases_nv_sc_template` contains NV-specific shortcuts (scratch dirs, p4, qsub).
To use it, source it from your `~/.cshrc` or copy it manually:

```tcsh
source /path/to/aliases_nv_sc_template
```

## Notes

- The `cshrc_template` sources NV global cshrc files from `/home/ip/shared/inf/rbs/`. These paths are only accessible on NV internal machines.
- The `vimrc_template` contains NV-internal Python/Perl shebang paths in its new-file templates. Adjust if using on non-NV machines.
