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

  boot.loader = {
    systemd-boot.enable = false;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi.canTouchEfiVariables = true;
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
