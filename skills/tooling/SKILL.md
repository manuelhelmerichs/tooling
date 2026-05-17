---
name: tooling
description: "Use when setting up projects, installing project dependencies, installing temporary tools, or managing this machine."
---

# Tooling

This machine is a WSL2 NixOS VM, with

- user: `nixos`,
- home: `/home/nixos`,
- architecture: `aarch64-linux`,
- tooling repo: `/home/nixos/tooling`,
- system flake: `/home/nixos/tooling#nixos`,
- shell: `zsh`;
- `direnv` with `nix-direnv` is enabled.

## Project setup

- For new projects, always prefer a repo-local dev environment (probably `flake.nix`; maybe `shell.nix`, or the project's existing Nix pattern) over global installs.
- If adding a flake, include the language toolchain and native libraries in `devShells.${system}.default`; use `.envrc` with `use flake` if direnv makes sense.
- For existing projects, follow the repo's lockfiles and package manager. Install language dependencies with the project tool (`npm ci`, `uv sync`, etc.) inside the project environment.
- If a missing binary is only needed once, use a temporary Nix shell (see below!) instead.

## Temporary tools

- Use `ntemp <package> [package ...]` for an interactive temporary shell (available after this system has been switched).
- For one command, or before `ntemp` is available, use `nix shell nixpkgs#<package> --command <cmd>`.
- Examples: `ntemp jq ripgrep`, `nix shell nixpkgs#jq --command jq --version`.

## Machine management

- `/home/nixos/tooling#nixos` is the single source of truth for system and Home Manager configuration.
- Put permanent user tools in `modules/home`; put system services, Nix settings, and host behavior in `modules/nixos` or `hosts/wsl`.
- Keep secrets and mutable state out of the repo, including auth tokens, shell history, caches, and databases!
- Always format Nix with `nixpkgs-fmt`.
- Validate flake changes with `nix flake check` when feasible, or build `.#nixosConfigurations.nixos.config.system.build.toplevel`.

## Helpers

```zsh
rebuild       # switch to /home/nixos/tooling#nixos
test-system   # test the same flake without making it the boot default
upgrade       # update flake inputs and switch the system
cleanup       # collect old system and user generations
ntemp ripgrep # open a temporary shell with nixpkgs#ripgrep
```
