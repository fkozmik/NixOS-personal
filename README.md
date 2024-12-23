[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

# My NixOS personal configuration

Here are my NixOS config files.  
Applying KISS principle.

**Note**: I am currently testing the Cosmic DE Alpha 4.

**Highlights**:

- Only **one configuration**: The one that lets me work.
- Single **ext4** partition
- Fully **declarative** **self-hosted** stuff


## Structure

- `configuration.nix`: Entrypoint, basic configs such as keymaps, fonts or networking variables; whatever configuration that is vowed to stay as it is.
- `flake.nix`: Only the Cosmic DE Flake ATM.
- `flake.lock`: //
- `Base`: Folder containing a tad more advanced configurations depending on what I like ATM *¯\\_(ツ)_/¯*.
  - `base.nix`: Mostly Nix Options with programs and services.
  - `cosmic.nix`: GUI confs
- `Users`: Folder containing personal configurations.
  - `aliases.nix`: The name should tell you exactly what it does ^^
  - `editors.nix`: Where I'll define my editors (Vim and VScodium) and their extensions (if any).
  - `users.nix`: I am alone there but I need to define the packages and the security options I need somewhere, right ? 

## Tooling and applications I use

Most relevant user apps daily drivers:

- Cosmic Alpha 4
- vim and VScodium (with proprietary extensions)
- zsh
- Basic `Console` emulator from Cosmic - It's good enough for me
- Brave
- fastfetch
- tailscale
- docker
- thefuck, you know what I mean...
- and NixOS (Special thanks to you !)
