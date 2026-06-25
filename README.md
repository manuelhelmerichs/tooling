Home Manager configuration for an Apple Silicon MacBook.

## Layout

- `flake.nix` defines the Home Manager configuration.
- `home` contains user-level packages, `dotfiles` the corresponding customizations.
- `skills` are linked into agent skill directories.
- `AGENTS.md` gives repository-local instructions.

## First switch

Assumes a macOS account with short name `manuel`. Install Determinate Nix, then run:

```zsh
mkdir -p "$HOME/Projects" &&
  nix shell github:NixOS/nixpkgs/nixpkgs-unstable#git --command \
    git clone https://github.com/manuelhelmerichs/tooling.git "$HOME/Projects/tooling" &&
  nix run github:nix-community/home-manager -- \
    switch --flake "$HOME/Projects/tooling#manuel"
```

## Custom helpers

After the first switch, zsh provides:

```zsh
rebuild       # home-manager switch --flake "$HOME/Projects/tooling#manuel"
test-system   # home-manager build --flake "$HOME/Projects/tooling#manuel"
upgrade       # update flake inputs, switch, then show git status
cleanup       # collect old Nix generations
ntemp jq      # temporary nix shell with nixpkgs#jq
```

GUI apps are managed manually outside this repository.
