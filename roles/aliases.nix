{
  environment.interactiveShellInit = ''
    eval $(thefuck --alias)
    alias gs='git status'
    alias gd='git diff'
    alias gl='git log --oneline'
    alias gogit="cd ~/Documents/git/ && ls"

    function godev {
          cd ~/tuleap
          git pull
          git reset --hard HEAD
          nix-shell
    }
  '';
}
