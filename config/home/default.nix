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
    ./zsh.nix
  ];
}
