{ config, pkgs, ... }:
{
  imports =
    [ ## Includes : 
      ../../configuration.nix
      ./Tartiflette-hardware-configuration.nix
    ];

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

  hardware = {
    enableAllFirmware = true;
    firmware = [ pkgs.sof-firmware ];
  };

  networking = {
    hostName = "Tartiflette"; 
    networkmanager.enable = true;
  };

  services = {
    displayManager.gdm.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "fr";
        variant = "azerty";
        };
    };
  };
}
