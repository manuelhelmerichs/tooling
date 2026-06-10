{ pkgs, username, ... }:

{
  users.mutableUsers = true;

  users.users.${username} = {
    isNormalUser = true;
    home = "/home/${username}";
    extraGroups = [ "wheel" ];
    linger = true;
    shell = pkgs.zsh;
  };
}
