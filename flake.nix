{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }:
    let
      mkSystem = { system, modules }:
        nixpkgs.lib.nixosSystem {
          inherit system modules;
          specialArgs = {
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
        };
    in {
      nixosConfigurations = {
        Tartiflette = mkSystem {
          system = "x86_64-linux";
          modules = [ ./machines/Tartiflette ];
        };
        Raclette = mkSystem {
          system = "x86_64-linux";
          modules = [ ./machines/Raclette ];
        };
        NixMac = mkSystem {
          system = "x86_64-linux";
          modules = [ ./machines/NixMac ];
        };
      };
    };
}
