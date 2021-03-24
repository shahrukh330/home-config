{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];
 
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Shahrukh Khan";
    userEmail = "shahrukh330@gmail.com";
    ignores = [ "*~" "*ghcid.txt" ];
    aliases = {
      g = "git";
      cob = "checkout -b";
      co = "checkout";
      ci = "commit";
      s = "status";
      d = "diff";
      pr = "pull --rebase";
      pl = "pull";
      plm = "pull origin main";
      l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
    };
    extraConfig = {
      core.editor = "nvim";
      # Allow keybase git protocol.
      protocol.keybase.allow = "always";
    };
  };
}
