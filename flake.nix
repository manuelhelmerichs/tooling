{
  description = "macOS Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ nixpkgs
    , home-manager
    , ...
    }:
    let
      system = "aarch64-darwin";
      username = "manuel";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = false;
          allowUnfreePredicate = pkg:
            builtins.elem (nixpkgs.lib.getName pkg) [
              "claude-code"
            ];
        };
      };
    in
    {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs username;
        };
        modules = [
          ./home
        ];
      };

      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
