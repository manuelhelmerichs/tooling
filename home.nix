{ config, pkgs, ... }:

{
  home.username = "admin";
  home.homeDirectory = "/Users/admin";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    gh # GitHub CLI
    ripgrep # grep replacement
    bat # cat replacement
    fd # find replacement
    bottom # system ressources
    vim # overwrites preinstalled vim

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    ".vimrc".source = dotfiles/vim/vimrc; # for vim (not neovim!)
    ".zshrc".source = dotfiles/zsh/zshrc; # THIS ASSUMES CONDA WAS INSTALLED VIA BREW

    ".config/gh/config.yml".source = dotfiles/gh/config.yml;
    ".config/gh/hosts.yml".source = dotfiles/gh/hosts.yml;
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
