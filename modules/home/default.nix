{ username, ... }:

{
  imports = [
    ./claude.nix
    ./cli.nix
    ./codex.nix
    ./git.nix
    ./shell.nix
    ./vim.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";

    sessionVariables = {
      EDITOR = "vim";
      VISUAL = "vim";
      PAGER = "less -FRX";
    };
  };

  programs.home-manager.enable = true;
}
