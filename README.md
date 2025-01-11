
## TODO
- use cloud service for syncing calibre library

## commands
```zsh
upgrade # upgrades nix generation, brew casks and commits receipts
cleanup # cleans previous nix generation and brew
```
See `dotfiles/zsh/zshrc`.

## rationale
Because of Apple's ecosystem and excellent hardware, switching to NixOS on bare metal does not make sense - system divergence is not a problem in a single user & single system setting! However, using Home Manager (this flake!) to declaratively manage my dotfiles and TUI applications does. For GUI applications, Homebrew is used. _Note that homebrew is only used for casks._ Only if no cask is available, the App Store is used.

Nix Flakes allow for reproducible projects, clear dependencies and comprehensible build processes.

## receipts
- Folder structure: ~/projects for all Git repositories (including `tooling`!).
- Installed Nix using Determinate System's installer, the config is under `/etc/nix/nix.conf`.
- Installed Homebrew. When reinstalling, take care of `minicoda`!
