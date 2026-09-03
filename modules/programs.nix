{ config, pkgs, ... }:
{
  programs = {
    vim = {
      defaultEditor = true;
      enable = true;
    };
    zsh.enable = true;
  };
}
