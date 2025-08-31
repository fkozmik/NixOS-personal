{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ./NixMac.nix
      ./NixMac-hardware-configuration.nix
    ];
}
