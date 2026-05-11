[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

# My NixOS personal configuration

Here are my NixOS config files.
Applying KISS principle.

**Highlights**:

- Multiple machines, **two roles**: `dev` (Cosmic DE) and `chill` (Gnome)
- Single **ext4** (or **btrfs**) partition
- Fully **declarative** **self-hosted** stuff


## Structure

```
NixOS-personal/
├── configuration.nix
├── customization/
├── flake.lock
├── flake.nix
├── machines
│   ├── Fondue
│   │   ├── default.nix
│   │   └── Fondue-hardware-configuration.nix
│   ├── NixMac
│   │   ├── default.nix
│   │   └── NixMac-hardware-configuration.nix
│   ├── Raclette
│   │   ├── default.nix
│   │   └── Raclette-hardware-configuration.nix
│   └── Tartiflette
│       ├── default.nix
│       └── Tartiflette-hardware-configuration.nix
├── modules
│   ├── battery-management.nix
│   ├── cosmic.nix
│   ├── fonts.nix
│   ├── gnome.nix
│   ├── programs.nix
│   ├── services.nix
│   ├── solaar.nix
│   └── users.nix
├── README.md
└── roles
    ├── chill.nix   # Gnome — lightweight/casual machines
    └── dev.nix     # Cosmic — daily driver workstations
```

## Machines

| Machine | Role | Notes |
|---|---|---|
| Raclette | `dev` | Desktop, Nvidia GPU |
| Tartiflette | `dev` | Laptop |
| Fondue | `chill` | Secondary machine |
| NixMac | `chill` | MacBook (Mac keyboard layout) |

## Tooling and applications I use

Most relevant user apps daily drivers:

- Cosmic Desktop Environment (dev role) / Gnome (chill role)
- vim
- zsh (oh-my-zsh)
- tailscale
- docker
- and NixOS (Special thanks to you !)
