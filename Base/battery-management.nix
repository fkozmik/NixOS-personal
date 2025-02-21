{ config, pkgs, ... }:
{
    powerManagement.powertop.enable = true; # Battery management
    services = {
        power-profiles-daemon.enable = false; # Battery management
        tlp = { # Battery management
            enable = true;
            settings = {
                CPU_BOOST_ON_AC = 1;
                CPU_BOOST_ON_BAT = 0;
                CPU_SCALING_GOVERNOR_ON_AC = "performance";
                CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
            };
        };
    system76-scheduler.settings.cfsProfiles.enable = true; # Battery management, thanks system76 !
    };
}
