{ ... }:
{
  imports = [
    # Enable & Configure Programs
    ./bash.nix
    ./gtk-qt.nix
    ./hyprland.nix
    ./kitty.nix
    ./neovim.nix
    ./packages.nix
    ./rofi.nix
    ./starship.nix
    ./zsh.nix
  ];
}
