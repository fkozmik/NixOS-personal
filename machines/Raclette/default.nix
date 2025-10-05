{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ../../configuration.nix
      ./Raclette-hardware-configuration.nix
    ];

  networking = {
    hostName = "Raclette"; 
    networkmanager.enable = true;
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    xkb = {
      layout = "fr";
      variant = "azerty";
    };
  };
}
