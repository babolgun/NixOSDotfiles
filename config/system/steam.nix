{ pkgs, config, lib, ... }:

{
  # Steam configuration -- I will not install at the beginning
  programs.steam = {
    enable = false;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
