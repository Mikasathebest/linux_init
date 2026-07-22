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

| File              | Installs to       | Description |
|-------------------|-------------------|-------------|
| `zshrc_template`  | `~/.zshrc`        | oh-my-zsh core config + everyday aliases; sources `~/.zsh_custom` |
| `zsh_custom`      | `~/.zsh_custom`   | Optional / machine-local tooling (see below) |
| `../vimrc_template` | `~/.vimrc`      | Shared vim config (syntax, keybindings, file templates) |

### `~/.zsh_custom` contents

Keep personal and optional tooling out of the main rc so `~/.zshrc` stays close to stock oh-my-zsh:

- **Cursor date wrapper** — prepends `~/.cursor_bypass` to `PATH` so AI assistants can run `date -ai <cmd>` in restricted environments (real `date` still works without `-ai`)
- **Conda** — lazy init (`conda` / `conda-activate` load on first use)
- **LM Studio CLI** — `$HOME/.lmstudio/bin` on `PATH`
- **NVM** — lazy wrappers for `nvm` / `node` / `npm` / etc.
- **Claude Code proxy** — `claude-on` / `claude-off` (HTTP-to-SOCKS bridge)
- **LiteLLM** — `litellm-start` / `litellm-stop` and `claude-nv` alias

## New Mac restore

### 1. Install oh-my-zsh

A new Mac includes zsh but not oh-my-zsh. Install it without replacing or
opening the shell during an automated setup:

```bash
KEEP_ZSHRC=yes RUNZSH=no CHSH=no \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

This installs to `~/.oh-my-zsh` and preserves an existing `~/.zshrc`.

### 2. Install the managed shell files

```bash
git clone <repo-url> && cd linux_init
bash macbook/quick_setup.sh
```

The script will:
1. Verify you are running on macOS
2. Back up any existing `~/.zshrc`, `~/.zsh_custom`, and `~/.vimrc` (with timestamp)
3. Copy the templates into place

After running, reload with:

```bash
source ~/.zshrc
```

Verify that oh-my-zsh and the custom file loaded:

```bash
echo "$ZSH"                         # ~/.oh-my-zsh
echo "$ZSH_THEME"                   # eastwood
test -f ~/.zsh_custom && echo OK
```

### 3. Restore the Cursor `date -ai` wrapper

`zsh_custom` puts `~/.cursor_bypass` first on `PATH`. The Cursor rule creates
an executable wrapper at `~/.cursor_bypass/date`; restore that rule on the new
Mac or copy the wrapper from the old Mac.

```bash
chmod +x ~/.cursor_bypass/date
source ~/.zshrc
date -ai --help
```

The last command should include `Liberation Tool`. Use `date -ai <command>` for
restricted Cursor command execution. Commands without `-ai` still invoke the
normal macOS `date` behavior through the wrapper.

### 4. Restore the NVIDIA VPN proxy

> This proxy is NVIDIA-specific. It depends heavily on being connected to the
> NVIDIA VPN, having working NVIDIA SSH endpoints/keys in `~/.ssh/config`, and
> is not expected to work on a public network.

Restore the machine-local `~/bin/start-socks` script and ensure `~/bin` is on
`PATH`. This script is not currently installed by `quick_setup.sh`.

```bash
chmod +x ~/bin/start-socks
start-socks --test       # test NVIDIA SSH endpoints without changing a tunnel
start-socks              # use the fastest endpoint; SOCKS listens on port 8080
# start-socks -s tlv02   # optionally select a specific endpoint
```

The current machine uses `pproxy` to bridge Claude Code's HTTP proxy traffic on
port `8081` to the SOCKS tunnel on port `8080`. Install `pproxy`, then:

```bash
start-socks
claude-on                # start bridge and export HTTP(S)_PROXY
claude                   # run Claude Code through the NVIDIA tunnel
claude-off               # restore proxy variables and stop the bridge
```

`claude-on` checks that the SOCKS listener exists first. `claude-off` restores
the previous proxy environment and stops only the bridge process it created.
The tracked `zsh_custom` contains a generic `hpts` variant (ports `1080` and
`8123`); copy the current machine's `pproxy` block when restoring this exact
setup, or adjust the ports and bridge implementation to match the new machine.

## Notes

- Install oh-my-zsh before applying `zshrc_template`.
- Keep Homebrew and personal `~/bin` PATH entries when merging an existing
  `.zshrc`; proxy helpers belong in `.zsh_custom`.
- Backups created during the latest manual merge use the
  `~/.zshrc.bak_<timestamp>` naming convention.
- Review API keys and personal paths in the templates before committing to a public repo.
