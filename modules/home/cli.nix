{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    bottom
    codex
    deadnix
    fd
    file
    jq
    just
    lsof
    nil
    nix-output-monitor
    nixd
    nixpkgs-fmt
    nodejs
    pandoc
    ripgrep
    shellcheck
    shfmt
    statix
    strace
    tree
    unzip
    uv
    zip
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
