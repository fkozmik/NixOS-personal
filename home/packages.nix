{ pkgs, ... }:
{
  home.packages = with pkgs; [
    baobab
    bitwarden-desktop
    claude-code
    discord
    docker
    fastfetch
    firefox
    ffmpeg
    gh
    gnome-disk-utility
    google-chrome
    libreoffice
    logseq
    monitor
    moonlight-qt
    nmon
    php
    powerline-fonts
    realvnc-vnc-viewer
    remmina
    rnote
    solaar
    spotify
    tailscale
    tmux
    tree
    xournalpp

    jetbrains.phpstorm
  ];
}
