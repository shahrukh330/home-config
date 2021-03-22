{ config, lib, pkgs, ... }:

let
  extensions = (with pkgs.vscode-extensions; [
  
  ]);
  vscode-with-extensions = pkgs.vscode-with-extensions.override {
    vscodeExtensions = extensions;
  };
in
  enviornment.systemPackages = [
    vscode-with-extensions
  ];
