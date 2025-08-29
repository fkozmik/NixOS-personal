{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ./Tartiflette.nix
      ./Tartiflette-hardware-configuration.nix
    ];
}
