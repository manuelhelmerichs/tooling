# Tooling

NixOS-WSL workstation configuration for `/home/nixos` on `aarch64-linux`.

## Layout

- `flake.nix` defines the `nixos` NixOS configuration.
- `hosts/wsl` contains the WSL2 host entry point.
- `modules/nixos` contains system modules.
- `modules/home` contains Home Manager modules integrated into NixOS.
- `skills/nixos-wsl-workstation` is linked into `~/.codex/skills` so Codex agents know this is a NixOS-WSL machine and should prefer Nix tooling.
- `AGENTS.md` gives repository-local instructions to Codex.

## First Switch

From this repository:

```zsh
sudo nixos-rebuild switch --flake /home/nixos/tooling#nixos
```

This enables flakes, switches the WSL configuration, creates the `nixos` user settings, and applies Home Manager.

## Daily Commands

After the first switch, zsh provides:

```zsh
rebuild       # sudo nixos-rebuild switch --flake "$HOME/tooling#nixos"
test-system   # sudo nixos-rebuild test --flake "$HOME/tooling#nixos"
upgrade       # nix flake update, switch, then show git status
cleanup       # collect old system and user generations
ntemp jq      # temporary nix shell with nixpkgs#jq
```

## Manual Maintenance

```zsh
nix flake update
nixpkgs-fmt .
nix flake check
```

If `nix flake check` is too expensive, evaluate the system closure instead:

```zsh
nix build .#nixosConfigurations.nixos.config.system.build.toplevel
```

## Notes

The repo intentionally does not manage Codex auth files, GitHub auth tokens, shell history, caches, or databases. Run `gh auth login` outside the repo after the first switch if GitHub authentication is not already configured.
