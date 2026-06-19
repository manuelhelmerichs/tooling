{
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

      tooling_flake() {
        printf '%s\n' "$HOME/Projects/tooling#manuel"
      }

      rebuild() {
        home-manager switch --flake "$(tooling_flake)" "$@"
      }

      test-system() {
        home-manager build --flake "$(tooling_flake)" "$@"
      }

      upgrade() {
        (
          cd "$HOME/Projects/tooling" &&
          nix flake update &&
          home-manager switch --flake "$(tooling_flake)" &&
          git status --short
        )
      }

      cleanup() {
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
