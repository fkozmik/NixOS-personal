{ config, pkgs, lib, ... }:
{
  imports =
    [ ## Includes : 
      ../../configuration.nix
      ./NixMac-hardware-configuration.nix
    ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "NixMac"; 
    networkmanager.enable = true;
  };

  services = {
    displayManager.gdm.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "fr";
        variant = "mac";
        };
    };
  };
}
