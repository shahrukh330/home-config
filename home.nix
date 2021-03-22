{ config, pkgs, ... }:

let
  allPlatformImports = [
    ./home/git.nix
  ];
  linuxImports = [
    ./home/cursor.nix
    ./home/i3.nix
    ./home/redshift.nix
  ];
in
{

  nixpkgs.config.allowUnfree = true;


  imports = if builtins.currentSystem == "x86_64-linux"
            then (allPlatformImports ++ linuxImports)
            else allPlatformImports;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "shahrukh";
  home.homeDirectory = "/home/shahrukh";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    dejavu_fonts
    source-serif-pro
    lxappearance

    ranger
    rofi
    rofi-unwrapped
    pavucontrol
  ];

  #programs.termite = {
  #  enable = true;
  #  clickableUrl = true;
  #};

  programs.alacritty = {
    enable = true;
  };
  
  programs.vscode = {
    enable = true;
    userSettings = {
      "update.channel" = "none";
      "editor.tabSize" = 2;
      "java.home" = "/var/run/current-system/sw/lib/openjdk/";
      "java.configuration.runtimes" = [
      {
        "name" = "JavaSE-11";
        "path" = "/var/run/current-system/sw/lib/openjdk/";
	default = true;
      }];
    };

    extensions = (with pkgs.vscode-extensions; [
      bbenoist.Nix
      ms-python.python
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
      name = "remote-ssh-edit";
      publisher = "ms-vscode-remote";
      version = "0.47.2";
      sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
    }
    {
      name = "java";
      publisher = "redhat";
      version = "0.76.0";
      sha256 = "0xb9brki4s00piv4kqgz6idm16nk6x1j6502jljz7y9pif38z32y";
    }];
  };
  
  programs.rofi = {
    enable = true;
  };
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
