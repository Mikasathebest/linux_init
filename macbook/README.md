# macOS Setup

Configuration templates for personal and work MacBooks.

## Hardware

- MacBook Air M4
- MacBook Pro M3

## Shell & Editor

| Component | Tool       |
|-----------|------------|
| Shell     | zsh (oh-my-zsh, theme: eastwood) |
| Editor    | vim        |

## Templates

| File              | Installs to | Description |
|-------------------|-------------|-------------|
| `zshrc_template`  | `~/.zshrc`  | oh-my-zsh config, aliases, conda/nvm lazy-loading, proxy helpers |
| `../vimrc_template` | `~/.vimrc` | Shared vim config (syntax, keybindings, file templates) |

## Quick Setup

```bash
git clone <repo-url> && cd linux_init
bash macbook/quick_setup.sh
```

The script will:
1. Verify you are running on macOS
2. Back up any existing `~/.zshrc` and `~/.vimrc` (with timestamp)
3. Copy the templates into place

After running, reload with:
```bash
source ~/.zshrc
```

## Notes

- The `zshrc_template` assumes oh-my-zsh is installed. Install it first if needed:
  `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- Review API keys and personal paths in the template before committing to a public repo.
