{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    bottom
    claude-code
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
    tree
    unzip
    uv
    vim
    wget
    zip
  ];
}
