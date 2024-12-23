{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ./base.nix
      ./hardware-configuration.nix
      ./cosmic.nix
    ];
}
