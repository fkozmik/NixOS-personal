{ config, pkgs, ... }:
{
  security = {
    rtkit.enable = true;
    sudo.extraRules = [
      { groups = [ "sudo" ]; commands = [ "ALL" ]; }
      { users = [ "fkozmik" ];
        commands = [ 
        { 
          command = "/etc/profiles/per-user/fkozmik/bin/docker"; 
          options = [ "SETENV" "NOPASSWD" ]; 
        } 
        ]; 
      }
    ];
  };

  users.users.fkozmik = {
    isNormalUser = true;
    description = "fkozmik";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      bitwarden
      discord
      docker
      fastfetch
      firefox
      ffmpeg
      fprintd
      git
      gnome-disk-utility
      google-chrome
      libreoffice
      nmon
      oh-my-zsh
      php
      powerline-fonts
      spotify
      tailscale
      thefuck
      tree
      tmux
      xournalpp
    ]; 
  };
}
