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
      baobab
      bitwarden
      discord
      docker
      fastfetch
      firefox
      ffmpeg
      git
      gnome-disk-utility
      google-chrome
      libreoffice
      logseq
      monitor
      nmon
      oh-my-zsh
      php
      pika-backup
      powerline-fonts
      solaar
      spotify
      tailscale
      tree
      tmux
      xournalpp
    ]; 
  };
}
