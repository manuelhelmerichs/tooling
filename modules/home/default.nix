{ username, ... }:

{
  imports = [
    ./agents.nix
    ./cli.nix
    ./git.nix
    ./shell.nix
    ./vim.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/Users/${username}";
    stateVersion = "26.05";

    sessionVariables = {
      EDITOR = "vim";
      VISUAL = "vim";
      PAGER = "less -FRX";
    };
  };

  programs.home-manager.enable = true;
}
