
## Commands
```zsh
upgrade # upgrades nix generation and commits changes
cleanup # cleans previous nix generations
```
See `dotfiles/zsh/zshrc`.

## Rationale
Using Home Manager (this flake!) to declaratively manage dotfiles and CLI tools on WSL2.
GUI applications are managed on the Windows host via winget.

## Receipts
- Folder structure: `~/projects` for all Git repositories, clone `tooling` thereto.
- Installed Nix using Determinate System's installer, the config is under `/etc/nix/nix.conf`.
- `nix run home-manager/master -- switch --flake ~/projects/tooling`.
- `gh auth login` to setup GitHub.
- R is installed separately (system package).
- GUI apps (VS Code, browsers, etc.) are on Windows host.
