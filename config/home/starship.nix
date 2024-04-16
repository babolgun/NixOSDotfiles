{ pkgs, config, ... }:

{
  # Starship prompt
  programs.starship = {
    enable = true;
    package = pkgs.starship;
  };
}
