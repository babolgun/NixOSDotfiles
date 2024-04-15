{ inputs, username, host,  ... }:
let
  inherit ( import ./../../hosts/${host}/options.nix ) gitUsername gitEmail theme;
in {
  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11"; 
  
  # Set the Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.${theme};

  # Import Program Configurations
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.hyprland.homeManagerModules.default
    ./../../config/home
  ];

  # Define Settings for Xresources
  xresources.properties = {
    "Xcursor.size" = 16;
  };

  # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
  };

  # Create XDG Dirs
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
