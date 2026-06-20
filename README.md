# Tooling

Home Manager configuration for an Apple Silicon MacBook Air.

## Layout

- `flake.nix` defines the `manuel` Home Manager configuration.
- `modules/home` contains user-level packages and dotfiles.
- `skills/tooling` is linked into agent skill directories so agents follow this machine's tooling rules.
- `AGENTS.md` gives repository-local instructions.

## Fresh Mac Setup

Create the macOS account with short name `manuel`, install Determinate Nix, then run the bootstrap command.

```zsh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Open a new terminal, then:

```zsh
mkdir -p "$HOME/Projects" &&
  nix shell github:NixOS/nixpkgs/nixpkgs-unstable#git --command \
    git clone https://github.com/manuelhelmerichs/tooling.git "$HOME/Projects/tooling" &&
  nix run github:nix-community/home-manager -- \
    switch --flake "$HOME/Projects/tooling#manuel"
```

## Custom Helpers

After the first switch, zsh provides:

```zsh
rebuild       # home-manager switch --flake "$HOME/Projects/tooling#manuel"
test-system   # home-manager build --flake "$HOME/Projects/tooling#manuel"
upgrade       # update flake inputs, switch, then show git status
cleanup       # collect old Nix generations
ntemp jq      # temporary nix shell with nixpkgs#jq
```

Declare CLI and development tools in `modules/home`. GUI apps are managed manually outside this repository.

This repository intentionally manages only `~/.zshrc` for interactive shell helpers. Login-shell files such as `~/.zprofile` and `~/.zshenv` stay unmanaged so machine-local PATH setup can live there without fighting Home Manager.
