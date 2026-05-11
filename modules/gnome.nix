{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        gnome-extension-manager
        gnome-menus
        gnome-tweaks
        gnomeExtensions.dash-to-dock
        gnomeExtensions.arcmenu
        wayvnc
    ];
    services = {
        desktopManager.gnome.enable = true;
        displayManager.autoLogin.enable = false;
    };
    networking.firewall.allowedTCPPorts = [ 5900 ];
}