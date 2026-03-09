{ config, pkgs, lib, ... }:
{
  imports = [
    ./roles/aliases.nix
    ./roles/cosmic.nix ## Temporary UI access
    ./roles/programs.nix
  ];

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
    package = pkgs.nixVersions.nix_2_31;
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
      "broadcom-sta-6.30.223.271-59-6.12.75"
    ];
  };

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

  networking.extraHosts =
    ''
      172.18.0.6 tuleap-web.tuleap-aio-dev.docker
      172.18.0.7 gitlab.local
    '';

  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "overlay2";
    };
    libvirtd.enable = true;
  };

  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      #settings.PermitRootLogin = "yes";
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
  };

  users.users.fkozmik = {
    isNormalUser = true;
    description = "fkozmik";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      docker
      fastfetch
      gh
      git
      gparted
      nmon
      oh-my-zsh
      powerline-fonts
      tailscale
      tmux
      vim
    ];
  };

  time.timeZone = "Europe/Paris";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; ## Current 25.11
}
