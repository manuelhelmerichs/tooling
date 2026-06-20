# Repository instructions

This repository owns the Home Manager user tooling configuration for `manuel` on Apple Silicon.

- Keep permanent CLI and user tools in `modules/home`.
- Do not declare GUI apps or macOS system defaults here; those are managed outside this repository.
- Keep login-shell files such as `~/.zprofile` and `~/.zshenv` unmanaged; only `~/.zshrc` should be used for repo-managed interactive shell helpers.
- Use `nixpkgs-fmt` for Nix formatting after making changes.
- Validate flake changes with `nix flake check` when feasible, or at least evaluate `homeConfigurations.manuel.activationPackage`.
- Keep secrets and mutable state out of this repository, including auth tokens, shell history, caches, and databases!
