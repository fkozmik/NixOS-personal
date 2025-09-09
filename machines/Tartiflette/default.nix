{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ../../configuration.nix
      ./Tartiflette-hardware-configuration.nix
    ];

  networking = {
    hostName = "Tartiflette"; 
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
