---
name: tooling
description: "Use when setting up projects or new agent skills, installing project dependencies or temporary tools, or managing this machine."
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

- For new projects, always prefer a repo-local dev environment (probably `flake.nix` or an `uv` Python environment) over global installs. Set up a succinct `AGENTS.md` right away and create a `CLAUDE.md` with just the content `@AGENTS.md`.
- If adding a flake, include the language toolchain and native libraries in `devShells.${system}.default`; use `.envrc` with `use flake` if direnv makes sense.
- For existing projects, follow the repo's lockfiles and package manager. Install language dependencies with the project tool (`npm ci`, `uv sync`, etc.) inside the project environment.
- If a missing binary is only needed once, use a temporary Nix shell (see below!) instead.

## Temporary tools

- Use `ntemp <package> [package ...]` for an interactive temporary shell (available after this system has been switched).
- For one command, or before `ntemp` is available, use `nix shell nixpkgs#<package> --command <cmd>`.
- Examples: `ntemp jq ripgrep`, `nix shell nixpkgs#jq --command jq --version`.
- In the (hopefully rare) case that nix cannot provide a suitable tool, make sure to leave a receipt (covering exactly what you installed and whereto) on disk (in the project directory or, if not working on a specific project, on the `~/Desktop`).

## Machine management

- `~/Projects/tooling#manuel` is the single source of truth for the Home Manager configuration.
- Put permanent CLI and user tools in `modules/home`.
- Agent skills are managed in `skills`, and linked via `modules/home/agents.nix`. All skills should follow that pattern.
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
