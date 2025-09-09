{ config, pkgs, ... }:
{
  services = {
    fprintd.enable = true;
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      #settings.PermitRootLogin = "yes";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true;
    pulseaudio.enable = false;
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
  };
}

