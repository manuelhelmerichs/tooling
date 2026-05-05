## Commands
```zsh
upgrade # upgrades nix generation and commits changes
cleanup # cleans previous nix generations
```
See `dotfiles/zsh/zshrc`.

## Rationale
Using Home Manager (this flake!) to declaratively manage dotfiles and CLI tools on macOS.
GUI applications are installed separately.

## Receipts
- Folder structure: `~/projects` for all Git repositories, clone `tooling` thereto.
- Installed Nix using Determinate System's installer, the config is under `/etc/nix/nix.conf`.
- `nix run home-manager/master -- switch --flake ~/projects/tooling#admin`.
- `gh auth login` to setup GitHub.
- R is installed separately (system package).
- GUI apps (Zed, browsers, etc.) are installed outside Home Manager.

## Zed setup
- `settings.json` and `keymap.json` are tracked under `dotfiles/zed`.
- Home Manager links them to `~/.config/zed/settings.json` and `~/.config/zed/keymap.json`.
- Vim mode is enabled, and `space` is used as the leader prefix for file search, code actions, symbols, comments, and pane commands.
