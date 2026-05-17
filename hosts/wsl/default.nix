{ hostname, ... }:

{
  imports = [
    ../../modules/nixos/base.nix
    ../../modules/nixos/home-manager.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/wsl.nix
  ];

  networking.hostName = hostname;

  # Keep this pinned to the first NixOS release used for this VM.
  system.stateVersion = "26.05";
}
