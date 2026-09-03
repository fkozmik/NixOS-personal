{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager }:
    let
      unstableOverlay = final: prev: {
        jetbrains = prev.jetbrains // {
          idea = (import nixpkgs-unstable {
            system = final.system;
            config.allowUnfree = true;
          }).jetbrains.idea;
        };
      };

      mkSystem = { system, modules }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = modules ++ [ home-manager.nixosModules.home-manager ];
          specialArgs = { inherit unstableOverlay; };
        };
    in {
      nixosConfigurations = {
        Fondue = mkSystem {
          system = "x86_64-linux";
          modules = [ ./machines/Fondue ];
        };
        Raclette = mkSystem {
          system = "x86_64-linux";
          modules = [ ./machines/Raclette ];
        };
        Tartiflette = mkSystem {
          system = "x86_64-linux";
          modules = [ ./machines/Tartiflette ];
        };
        NixMac = mkSystem { ## Non cheese related so down you go...
          system = "x86_64-linux";
          modules = [ ./machines/NixMac ];
        };
      };
    };
}
