[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

# My NixOS personal configuration

Here are my NixOS config files.  
Applying KISS principle.

**Note**: Currently on Cosmic DE.

**Highlights**:

- Only **one configuration**: The one that lets me work.
- Single **ext4** (or **btrfs**) partition
- Fully **declarative** **self-hosted** stuff


## Structure

```
./NixOS-personal/
├── Base
│   ├── base.nix
│   ├── battery-management.nix
│   ├── cosmic.nix
│   └── default.nix
├── configuration.nix
├── flake.lock
├── flake.nix
├── NixMac
│   ├── default.nix
│   ├── NixMac-hardware-configuration.nix
│   └── NixMac.nix
├── README.md
├── Tartiflette
│   ├── default.nix
│   ├── Tartiflette-hardware-configuration.nix
│   └── Tartiflette.nix
└── Users
    ├── aliases.nix
    ├── default.nix
    ├── editors.nix
    └── users.nix
```

## Tooling and applications I use

Most relevant user apps daily drivers:

- Cosmic Desktop Environment
- vim and VScodium (with proprietary extensions)
- zsh
- Basic `Console` emulator from Cosmic - It's good enough for me
- fastfetch
- tailscale
- docker
- thefuck, you know what it does.
- and NixOS (Special thanks to you !)
