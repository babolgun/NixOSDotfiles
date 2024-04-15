{ pkgs, config, ... }:
{
  imports = [
    # Enable & Configure Programs
    ./bash.nix
    ./hyprland.nix
    ./kitty.nix
    ./neofetch.nix
    ./neovim.nix
    ./packages.nix
    ./zsh.nix
  ];
}
