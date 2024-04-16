{ pkgs, config, ... }:

{
  # Starship prompt
  programs.starship = {
    enable = false;
    package = pkgs.starship;
  };
}
