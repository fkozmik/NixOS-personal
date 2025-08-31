{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      Tartiflette = nixpkgs.lib.nixosSystem {
        modules = [
          ./Tartiflette
        ];
      };
      NixMac = nixpkgs.lib.nixosSystem {
        modules = [
          ./NixMac
        ];
      };
    };
  };
}