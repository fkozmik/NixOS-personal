{ ... }:
{
  programs.git = {
    enable = true;
    extraConfig = {
      column.ui = "auto";
      commit.verbose = true;
      help.autocorrect = "prompt";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      rebase = {
        autoStash = true;
        updateRefs = true;
      };
      rerere.enabled = true;
    };
  };
}
