{ config, pkgs, lib, ... }:
{
  imports =
    [ ## Includes : 
      ../../server-configuration.nix
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
    xserver = {
      enable = true;
      xkb = {
        layout = "fr";
        variant = "mac";
        };
    };
  };
}
