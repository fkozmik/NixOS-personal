{ config, pkgs, ... }:
{
  imports =
    [ ## Includes :
      ../../configuration.nix
      ./Raclette-hardware-configuration.nix
      ../../roles/dev.nix
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

  services = {
    displayManager.gdm.enable = true;
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "fr";
        variant = "azerty";
        };
    };
  };

  hardware = {
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
