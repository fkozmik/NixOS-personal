{ config, pkgs, ... }:
{
  programs = {
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
}
