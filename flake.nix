{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, sops-nix, home-manager, ... }@inputs:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      formatter.${system} = pkgs.nixpkgs-fmt;
      nixosConfigurations = let
        mkNixosConfiguration = name: secrets:
          nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs; };
            modules = [
              (./hosts + "/${name}" + /configuration.nix)
              (./hosts + "/${name}" + /hardware-configuration.nix)
            ] (if secrets then [
              sops-nix.nixosModules.sops
              { sops.defaultSopsFile = ./hosts + "/${name}" + /secrets.yaml; }
            ] else
              [ ]);
          };
      in { kyle = mkNixosConfiguration "kyle" true; };
    };
}
