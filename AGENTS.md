# Repository instructions

This repository owns the WSL2 NixOS workstation configuration for user `nixos` on `aarch64-linux`.

- Keep permanent packages in `modules/nixos` or `modules/home`: User tools in `modules/home`; system services, Nix settings, and host behavior in `modules/nixos` or `hosts/wsl`.
- Use `nixpkgs-fmt` for Nix formatting after making changes.
- Validate flake changes with `nix flake check` when feasible, or at least evaluate `nixosConfigurations.nixos.config.system.build.toplevel`.
- Keep secrets and mutable state out of this repository, including auth tokens, shell history, caches, and databases!
