{ config, pkgs, ... }:

{
  imports = [
    ./autorun.nix
    ./boot.nix
    ./displaymanager.nix
    ./hwclock.nix
    ./intel-gpu.nix
    ./nfs.nix
    ./ntp.nix
    ./opengl.nix
    ./packages.nix
    ./polkit.nix
    ./services.nix
    ./steam.nix
  ];
}
