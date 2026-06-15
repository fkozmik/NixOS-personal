[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

# My NixOS personal configuration

NixOS config files. KISS principle.

**Highlights**:

- Multiple machines, **two roles**: `dev` (Cosmic DE) and `chill` (Gnome)
- Single flake entry point with an **unstable overlay** for select packages (PhpStorm)
- Fully **declarative** configuration — locale, GC, SSH keys, sudo rules, services

## Structure

```
NixOS-personal/
├── configuration.nix              # Shared base: locale, nix settings, aliases, overlays
├── flake.nix                      # Flake inputs (nixos-25.11 + unstable) and mkSystem helper
├── flake.lock
├── customization/                 # Wallpapers and theme assets
├── machines/
│   ├── Fondue/
│   │   ├── default.nix            # chill role, sof-firmware
│   │   └── Fondue-hardware-configuration.nix
│   ├── NixMac/
│   │   ├── default.nix            # chill role, battery mgmt, mac keyboard layout
│   │   └── NixMac-hardware-configuration.nix
│   ├── Raclette/
│   │   ├── default.nix            # dev role, Nvidia GPU, GRUB
│   │   └── Raclette-hardware-configuration.nix
│   └── Tartiflette/
│       ├── default.nix            # dev role, laptop, battery mgmt, sof-firmware
│       └── Tartiflette-hardware-configuration.nix
├── modules/
│   ├── battery-management.nix     # Power/charging thresholds (laptops only)
│   ├── cosmic.nix                 # Cosmic DE
│   ├── fonts.nix
│   ├── gnome.nix                  # Gnome DE
│   ├── programs.nix               # git, vim, zsh (oh-my-zsh)
│   ├── services.nix               # tailscale, openssh, pipewire, sunshine, printing, fprintd
│   ├── solaar.nix                 # Logitech device manager
│   └── users.nix                  # fkozmik user, packages, SSH authorized keys
└── roles/
    ├── chill.nix                  # Gnome + programs + services + users
    └── dev.nix                    # Cosmic + fonts + programs + services + solaar + users
```

## Machines

| Machine | Role | Notes |
|---|---|---|
| Raclette | `dev` | Desktop, Nvidia GPU |
| Tartiflette | `dev` | Laptop, battery management |
| Fondue | `chill` | Secondary machine |
| NixMac | `chill` | MacBook, mac keyboard layout, battery management |

## Roles

| Role | DE | Extra modules |
|---|---|---|
| `dev` | Cosmic | fonts, solaar |
| `chill` | Gnome | — |

## Key packages and services

- **Shell**: zsh + oh-my-zsh (`jonathan` theme)
- **Editor**: vim (default)
- **VCS**: git (with opinionated defaults: rerere, autoStash, updateRefs…)
- **Networking**: tailscale, openssh (key-only)
- **Audio**: pipewire + PulseAudio compat
- **Remote**: sunshine (game streaming), moonlight-qt, remmina, RealVNC
- **Dev tools**: docker, gh, PhpStorm (from unstable channel), php, claude-code
- **Desktop apps**: Firefox, Chrome, Bitwarden, Discord, Spotify, LibreOffice, Logseq, rnote, xournalpp
