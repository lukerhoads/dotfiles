{
  description = "Luke's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
    in
    {
      packages = 
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit nixpkgs; };
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
      nixosConfigurations = {
        home = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/home
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.luke = import ./users/luke;
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };
      };
    };
}
