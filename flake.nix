{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      Tartiflette = nixpkgs.lib.nixosSystem {
        modules = [
          ./machines/Tartiflette
        ];
      };
      Raclette = nixpkgs.lib.nixosSystem {
        modules = [
          ./machines/Raclette
        ];
      };
      NixMac = nixpkgs.lib.nixosSystem {
        modules = [
          ./machines/NixMac
        ];
      };
    };
  };
}
