{ ... }:
{
  imports = [
    ./packages.nix
    ./programs/git.nix
    ./programs/zsh.nix
  ];

  home = {
    username = "fkozmik";
    homeDirectory = "/home/fkozmik";
    stateVersion = "26.05";
  };
}
