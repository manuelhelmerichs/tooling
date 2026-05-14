{ inputs, username, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "pre-hm";
    extraSpecialArgs = {
      inherit inputs username;
    };
    users.${username} = import ../home;
  };
}
