{ username, ... }:

{
  imports = [
    ./agents.nix
    ./direnv.nix
    ./git.nix
    ./mineru.nix
    ./packages.nix
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
