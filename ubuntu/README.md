# Ubuntu Setup

Configuration templates for Ubuntu (22.04 / 24.04) machines, both personal and work.

## Shell & Editor

| Component | Tool       |
|-----------|------------|
| Shell     | tcsh / csh |
| Editor    | vim        |

## Templates

| File              | Installs to | Description |
|-------------------|-------------|-------------|
| `cshrc_template`  | `~/.cshrc`  | History, locale, colored prompt, common aliases, per-host overrides |
| `../vimrc_template` | `~/.vimrc` | Shared vim config (syntax, keybindings, file templates) |

## Quick Setup

```bash
git clone <repo-url> && cd linux_init
bash ubuntu/quick_setup.sh
```

The script will:
1. Verify you are running on Ubuntu (checks `/etc/os-release`)
2. Back up any existing `~/.cshrc` and `~/.vimrc` (with timestamp)
3. Copy the templates into place

After running, reload with:
```tcsh
source ~/.cshrc
```

## Notes

- The `cshrc_template` supports per-host overrides via `~/.cshrc.local`. Create that file for machine-specific settings.
- Make sure `tcsh` is installed: `sudo apt install tcsh`
