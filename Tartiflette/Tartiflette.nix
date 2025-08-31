{ config, pkgs, lib, modulesPath,... }:
{
  imports =
    [ ## Includes : 
      ../configuration.nix
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