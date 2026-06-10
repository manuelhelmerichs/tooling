{ inputs, lib, pkgs, username, ... }:

{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      auto-optimise-store = true;
    };

    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  nixpkgs.config = {
    allowUnfree = false;
    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "claude-code"
      ];
  };

  time.timeZone = "Etc/UTC";
  i18n.defaultLocale = "en_US.UTF-8";

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
    wget
  ];

  security.sudo.extraRules = [
    {
      users = [ username ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
