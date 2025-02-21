{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ./base.nix
      ./battery-management.nix
      ./cosmic.nix
      ./hardware-configuration.nix
    ];
}
