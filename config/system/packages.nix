{ pkgs, config, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs -- I omitted: unrar v4l-utils 
  environment.systemPackages = with pkgs; [
    appimage-run
    brightnessctl
    btop 
    cmatrix 
    cowsay 
    curl 
    eza
    git 
    gnumake 
    go 
    htop 
    hugo 
    libnotify 
    libvirt
    lm_sensors 
    lolcat 
    lsd 
    lshw
    material-icons 
    meson 
    neofetch 
    networkmanagerapplet 
    nh
    ninja 
    nodejs 
    noto-fonts-color-emoji 
    pkg-config 
    playerctl 
    polkit_gnome 
    ripgrep 
    socat 
    symbola
    toybox 
    unzip 
    virt-viewer swappy 
    wget 
    wl-clipboard 
    yad 
    ydotool 
  ];

  programs = {
    steam.gamescopeSession.enable = false; # I will not install Steam at first 
    dconf.enable = true;
    seahorse.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    virt-manager.enable = true;
  };

  virtualisation.libvirtd.enable = true;
}
