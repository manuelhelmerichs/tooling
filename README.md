
## TODO
- switch from nvim to vim plugin -> no two nvim configs, etc.
- wait for zotero 7 cask => sync brew to brewfile, put it in casks folder

## commands
To update TUI applications:
```
nix flake update
home-manager switch --flake ~/projects/tooling
```
These commands are bundled into the `tooling` alias in `dotfiles/zsh/zshrc`.

## rationale
Because of Apple's ecosystem and excellent hardware, switching to NixOS on bare metal does not make sense - system divergence is not a problem in a single user & single system setting! However, using Home Manager (this flake!) to declaratively manage my dotfiles and TUI applications does. For GUI applications, Homebrew is used. _Note that homebrew is only used for casks._ Only if no cask is available, the App Store is used.

Nix Flakes allow for reproducible projects, clear dependencies and comprehensible build processes.
