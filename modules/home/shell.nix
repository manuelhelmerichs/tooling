{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ $- == *i* && -z "''${NIXOS_KEEP_BASH-}" ]]; then
        exec ${pkgs.zsh}/bin/zsh
      fi
    '';
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      path = "$HOME/.cache/zsh/history";
      save = 10000;
      size = 10000;
    };

    initContent = ''
      PROMPT='λ '
      bindkey -v

      rebuild() {
        sudo nixos-rebuild switch --flake "$HOME/tooling#nixos" "$@"
      }

      test-system() {
        sudo nixos-rebuild test --flake "$HOME/tooling#nixos" "$@"
      }

      upgrade() {
        (
          cd "$HOME/tooling" &&
          nix flake update &&
          sudo nixos-rebuild switch --flake "$HOME/tooling#nixos" &&
          git status --short
        )
      }

      cleanup() {
        sudo nix-collect-garbage -d
        nix-collect-garbage -d
      }

      ntemp() {
        if [ "$#" -eq 0 ]; then
          echo "usage: ntemp <package> [package ...]" >&2
          return 2
        fi

        local args=()
        local package
        for package in "$@"; do
          args+=("nixpkgs#$package")
        done
        nix shell "''${args[@]}"
      }
    '';
  };
}
