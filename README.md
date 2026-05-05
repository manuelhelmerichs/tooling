## Commands
```zsh
upgrade # upgrades Nix generation, Homebrew packages, and commits receipts
cleanup # cleans previous Nix generations and Homebrew cache
```
See `dotfiles/zsh/zshrc`.

## Rationale
Using Home Manager (this flake!) to declaratively manage dotfiles and CLI tools on macOS.
Homebrew manages GUI applications and any packages that are unavailable or impractical through Nix.

## Receipts
- Folder structure: `~/projects` for all Git repositories, clone `tooling` thereto.
- Installed Nix using Determinate System's installer, the config is under `/etc/nix/nix.conf`.
- `nix run home-manager/master -- switch --flake ~/projects/tooling#admin`.
- Installed Homebrew; `upgrade` refreshes `Brewfile` with `brew bundle dump`.
- `gh auth login` to setup GitHub.
- R is installed separately (system package).
- GUI apps (Zed, browsers, etc.) are installed through Homebrew casks where possible.

## Zed setup
- `settings.json` and `keymap.json` are tracked under `dotfiles/zed`.
- Home Manager links them to `~/.config/zed/settings.json` and `~/.config/zed/keymap.json`.
- Vim mode is enabled, and `space` is used as the leader prefix for file search, code actions, symbols, comments, and pane commands.
