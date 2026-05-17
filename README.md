# Tooling

NixOS-WSL workstation configuration.

## Layout

- `flake.nix` defines the `nixos` NixOS configuration.
- `hosts/wsl` contains the WSL2 host entry point.
- `modules/nixos` contains system modules.
- `modules/home` contains Home Manager modules integrated into NixOS.
- `skills/tooling` is linked into `~/.codex/skills` so Codex agents know this is a NixOS-WSL machine and prefer Nix tooling.
- `AGENTS.md` gives repository-local instructions.

## First switch

From this repository:

```zsh
sudo nixos-rebuild switch --flake /home/nixos/tooling#nixos
```

This enables flakes, switches the WSL configuration, creates the `nixos` user settings, and applies Home Manager.

## Custom helpers

After the first switch, zsh provides:

```zsh
rebuild       # sudo nixos-rebuild switch --flake "$HOME/tooling#nixos"
test-system   # sudo nixos-rebuild test --flake "$HOME/tooling#nixos"
upgrade       # nix flake update, switch, then show git status
cleanup       # collect old system and user generations
ntemp jq      # temporary nix shell with nixpkgs#jq
```
