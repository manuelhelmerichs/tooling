---
name: tooling
description: "Use when setting up projects, installing project dependencies, temporary tools, or managing this machine."
---

# Tooling

This machine is an Apple Silicon macOS workstation, with

- user: `manuel`,
- home: `/Users/manuel`,
- architecture: `aarch64-darwin`,
- tooling repo: `~/Projects/tooling`,
- Home Manager flake: `~/Projects/tooling#manuel`,
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

- `~/Projects/tooling#manuel` is the single source of truth for Home Manager configuration.
- Put permanent CLI and user tools in `modules/home`.
- Do not declare GUI apps or macOS system defaults here; those are managed outside this repository.
- Keep login-shell files such as `~/.zprofile` and `~/.zshenv` unmanaged; only `~/.zshrc` should be used for repo-managed interactive shell helpers.
- Keep secrets and mutable state out of the repo, including auth tokens, shell history, caches, and databases!
- Always format Nix with `nixpkgs-fmt`.
- Validate flake changes with `nix flake check` when feasible, or evaluate `.#homeConfigurations.manuel.activationPackage`.

## Helpers

```zsh
rebuild       # switch to ~/Projects/tooling#manuel
test-system   # build the same flake without switching
upgrade       # update flake inputs, switch, then show git status
cleanup       # collect old Nix generations
ntemp ripgrep # open a temporary shell with nixpkgs#ripgrep
```
