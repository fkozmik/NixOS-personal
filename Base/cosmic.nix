{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        cosmic-osd
        cosmic-term
        cosmic-edit
        cosmic-comp
        cosmic-store
        cosmic-randr
        cosmic-panel
        cosmic-icons
        cosmic-files
        cosmic-session
        cosmic-greeter
        cosmic-applets
        cosmic-settings
        cosmic-launcher
        cosmic-protocols
        cosmic-screenshot
        cosmic-applibrary
        cosmic-design-demo
        cosmic-notifications
        cosmic-settings-daemon
        cosmic-workspaces-epoch
        xdg-desktop-portal-cosmic
        rPackages.cosmicsig
        rPackages.COSMIC_67
    ];

    nix.settings = {
      substituters = [
        "https://cosmic.cachix.org"
      ];
      trusted-public-keys = [
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      ];
    };

 services.desktopManager.cosmic.enable = true;
 services.displayManager.cosmic-greeter.enable = true;
}
