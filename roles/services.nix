{ config, pkgs, ... }:
{
  security.rtkit.enable = true;

  services = {
    fprintd.enable = true;
    hardware.bolt.enable = true;
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      #settings.PermitRootLogin = "yes";
    };
    pipewire = {
      enable = true;
      alsa.enable = false;
      alsa.support32Bit = false;
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
