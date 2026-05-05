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
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zsh # shell
    gh # GitHub CLI
    ripgrep # grep replacement
    bat # cat replacement
    fd # find replacement
    bottom # system resources
    vim # overwrites preinstalled vim
    direnv # e.g., run nix develop automatically in a directory

    # various libraries that are required by other packages (e.g., R, Python)
    pandoc # Universal document converter
    uv # manage Python
  ];

  home.file = {
    ".vimrc".source = dotfiles/vim/vimrc; # for vim (not neovim!)
    ".zshrc".source = dotfiles/zsh/zshrc;
    ".config/gh/config.yml".source = dotfiles/gh/config.yml;
    ".config/zed/settings.json" = {
      source = dotfiles/zed/settings.json;
      force = true;
    };
    ".config/zed/keymap.json" = {
      source = dotfiles/zed/keymap.json;
      force = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.git = {
    enable = true;
    settings = {
      push = {
        autoSetupRemote = true;
        default = "simple";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
