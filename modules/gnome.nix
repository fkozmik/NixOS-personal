{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        gnome-extension-manager
        gnome-menus
        gnome-tweaks
        gnomeExtensions.dash-to-dock
        gnomeExtensions.arcmenu
    ];
    services = {
        desktopManager.gnome.enable = true;
        displayManager.autoLogin.enable = false;
        xrdp.enable = true;
        xrdp.defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
    };
    networking.firewall.allowedTCPPorts = [ 3389 ];
}
