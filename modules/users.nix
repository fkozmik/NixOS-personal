{ config, pkgs, pkgs-unstable, ... }:
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
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF8yR8z38q2a4jsmc3MOw5aOj8sI8e1Mz6lrBBRhbLc6 fkozmik@Raclette"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBCPCGl8/n1cMH1J8oG4Rrtm3JKGPN+wRvSdt8Ga4V5q Tartiflette"
    ];
    packages = with pkgs; [
      baobab
      bitwarden-desktop
      claude-code
      discord
      docker
      fastfetch
      firefox
      ffmpeg
      gh
      git
      gnome-disk-utility
      google-chrome
      libreoffice
      logseq
      monitor
      nmon
      oh-my-zsh
      php
      powerline-fonts
      realvnc-vnc-viewer
      remmina
      solaar
      spotify
      tailscale
      tree
      tmux
      vim
      xournalpp

      pkgs-unstable.jetbrains.phpstorm
    ]; 
  };
}
