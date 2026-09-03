{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      gs = "git status";
      gd = "git diff";
      gl = "git log --oneline";
      gogit = "cd ~/Documents/git/ && ls";
    };
    oh-my-zsh = {
      enable = true;
      theme = "jonathan";
      plugins = [ "sudo" "systemadmin" "vi-mode" ];
    };
  };
}
