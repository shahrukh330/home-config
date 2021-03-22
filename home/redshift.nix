{ config, lib, pkgs, ... }:

{
  # https://en.wikipedia.org/wiki/Redshift_(software)
  services.redshift = {
    enable = true;
    tray = true;
    # Chicago USA
    latitude = "41.878113";
    longitude = "-87.629799";
  };
}
