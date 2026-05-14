---
name: nixos-wsl-workstation
description: Use when Codex is working on this user's WSL2 NixOS workstation, especially for shell commands, dependency/tool installation, NixOS or Home Manager changes, repo setup, editor/tooling preferences, or any task where Linux vs macOS assumptions matter.
---

# NixOS WSL Workstation

This machine is a WSL2 NixOS VM. Treat Nix as the source of truth for system packages, user packages, and temporary tools.

## Machine Facts

- OS: NixOS on WSL2.
- User: `nixos`.
- Home: `/home/nixos`.
- Architecture: `aarch64-linux`.
- Tooling repo: `/home/nixos/tooling`.
- System flake: `/home/nixos/tooling#nixos`.
- Shell: `zsh`.
- Editor: `vim`.

## Operating Rules

- Prefer Nix for tools. For one-off commands, use temporary shells such as `nix shell nixpkgs#<package> --command <cmd>` instead of asking the user to install packages manually.
- Keep permanent packages in the flake modules under `modules/nixos` or `modules/home`; do not use Homebrew, macOS paths, or GUI editor assumptions.
- Use `sudo nixos-rebuild switch --flake /home/nixos/tooling#nixos` for system changes.
- Use `nix flake update` from `/home/nixos/tooling` when updating pinned inputs.
- Keep secrets and mutable runtime state out of the repo. Do not manage Codex auth files, GitHub auth tokens, shell history, caches, or databases.
- Expect Windows interop to exist but do not rely on Windows PATH entries; this machine intentionally prefers Nix-provided Linux tools.

## Repo Conventions

- Host-specific NixOS configuration lives in `hosts/wsl`.
- Shared NixOS modules live in `modules/nixos`.
- Home Manager modules live in `modules/home`.
- Dotfiles are kept only when plain file contents are clearer than a Home Manager option.
- Codex-facing machine guidance lives in this skill and is linked into `~/.codex/skills` by Home Manager.

## Useful Commands

```zsh
rebuild       # switch to /home/nixos/tooling#nixos
test-system   # test the same flake without making it the boot default
upgrade       # update flake inputs and switch the system
cleanup       # collect old system and user generations
ntemp ripgrep # open a temporary shell with nixpkgs#ripgrep
```
