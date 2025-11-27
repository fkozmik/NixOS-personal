{ config, pkgs, lib, ... }:
let
  folder = ./roles;
  nixFiles = lib.filterAttrs 
    (name: type: type == "regular" && lib.hasSuffix ".nix" name) 
    (builtins.readDir folder);
  rolesImport = lib.mapAttrsToList (name: _: folder + ("/" + name)) nixFiles;
in {
  imports =
    []++ rolesImport;

  i18n = {
    defaultLocale = "fr_FR.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (pkg: true);
    permittedInsecurePackages = [
      "broadcom-sta-6.30.223.271-57-6.12.44"
      "electron-27.3.11"
    ];
  };

  time.timeZone = "Europe/Paris";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; ## Current 24.11
}
