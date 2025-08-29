{ config, pkgs, ... }:
{
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
    allowUnfreePredicate = (pkg: true);
    permittedInsecurePackages = [
      "electron-27.3.11"
    ];
  };

  programs = {
    direnv = {
      enable = true;
      loadInNixShell = true;
      nix-direnv.enable = true;
      };
    git = {
      config = {
        column = { ui = "auto"; };
        commit = {verbose = "true"; };
        help = { autocorrect = "prompt"; };
        init = { defaultBranch = "main"; };
        push = { autoSetupRemote = "true"; };
        rebase = { autoStash = "true"; };
        rebase = { updateRefs = "true"; };
        rerere = { enabled = "true"; };
      };
      enable = true;
      prompt.enable = true;
    };
    thefuck.enable = true;
    vim = {
      defaultEditor = true;
      enable = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true; 
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "agnoster";
        plugins = [
          "sudo"
          "systemadmin"
          "vi-mode"
        ];
      };
    };
  };

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
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      xkb = {
        layout = "fr";
        variant = "azerty";
      };
    };
  };

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };
}
