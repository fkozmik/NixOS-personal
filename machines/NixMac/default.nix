{ config, pkgs, lib, ... }:
{
  imports =
    [ ## Includes : 
      ../../configuration.nix
      ./NixMac-hardware-configuration.nix
    ];

  networking = {
    hostName = "NixMac"; 
    networkmanager.enable = true;
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    xkb = {
      layout = "fr";
      variant = "mac";
    };
  };
}
