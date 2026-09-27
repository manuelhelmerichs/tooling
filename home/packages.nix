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
    texliveFull
    tree
    unzip
    uv
    vim
    wget
    zip
  ];
}
