{ ... }:
{
  imports = [
    # Enable & Configure Programs
    ./alacritty.nix
    ./bash.nix
    ./gtk-qt.nix
    ./hyprland.nix
    ./kitty.nix
    ./neovim.nix
    ./packages.nix
    ./rofi.nix
    ./starship.nix
    ./swappy.nix
    ./swaylock.nix
    ./swaync.nix
    ./waybar.nix
    ./wlogout.nix
    ./zsh.nix
    # files
    ./files.nix
  ];
}
