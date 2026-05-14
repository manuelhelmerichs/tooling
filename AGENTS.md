# Repository Instructions

This repository owns the WSL2 NixOS workstation configuration for user `nixos` on `aarch64-linux`.

- Treat `/home/nixos/tooling#nixos` as the source of truth for system and Home Manager configuration.
- Prefer Nix-provided tools. For temporary tooling, use `nix shell nixpkgs#<package> --command <cmd>` or the `ntemp` shell helper after the system has been switched.
- Keep permanent packages in `modules/nixos` or `modules/home`.
- Use `nixpkgs-fmt` for Nix formatting.
- Validate flake changes with `nix flake check` when feasible, or at least evaluate/build `nixosConfigurations.nixos.config.system.build.toplevel`.
