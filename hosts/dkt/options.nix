let
  setUsername = "luca";
  setHostname = "dkt";
in {
  username = "${setUsername}";
  hostname = "${setHostname}";
  userhome = "/home/${setUsername}";
  flakeDir = "/home/${setUsername}/.dotfiles";
  wallpaperGit = "https://gitlab.com/Zaney/my-wallpapers.git";
  wallpaperDir = "/home/${setUsername}/Pictures/Wallpapers";
  screenshotDir = "/home/${setUsername}/Pictures/Screenshots";
  flakePrev = "/home/${setUsername}/.flake-prev";
  flakeBackup = "/home/${setUsername}/.flake-backup";

  # Git configuration
  gitUsername = "Luca Babolin";
  gitEmail = "l.babolgun@gmail.com";

  # Base16 theme
  theme = "atelier-plateau";

  # Hyprland settings ---------------------------------------------
  borderAnim = true; # Enable/Disable Hyprland Border Animation 
  extraMonitorSettings = "
    monitor=DP-1,1920x1080@165,0x0,1
    monitor=HDMI-A-1,preferred,auto,1,transform,3
  ";

  waybarAnim = true; # Enable/Disable Waybar Animation CSS
  bar-number = true; # Enable/Disable Workspace Numbers in Waybar

  # System Settings ----------------------------------------------
  clock24h = false;
  theLocale = "en_US.UTF-8";
  theKBDLayout = "us";
  theSecondKBDLayout = "de";
  theKBDVariant = "altgr-intl";
  theLCVariables = "en_US.UTF-8";
  theTimezone = "Europe/Berlin";
  theShell = "zsh"; # Available options: bash, zsh 
  theKernel = "default"; # Available options: default, latest, lqx, xanmod, zen
  sdl-videodriver = "x11"; # Either x11 or wayland ONLY. Games might require x11

  cpuType = "intel";
  gpuType = "intel";
  
  # Enable/Setup NFS
  nfs = false;
  nfsMountPoint = "/mnt/nas";
  nfsDevice = "nas:/volume1/nas";

  # NPT & HWClock Settings
  ntp = true;
  localHWClock = false;

  # Enable Printer & Scanner Support
  printer = false;

  # Program Options
  browser = "firefox";
  terminal = "kitty";
  distrobox = false;
  flatpack = false;
  kdenlive = false;
  blender = false;
  enableZeroAd = false;

  # Enable Support for Logitech Devices
  logitech = false;

  # Enable Terminals ( if all disabled system defaults to Kitty )
  wezterm = false;
  alacritty = false;
  kitty = true;

  # Enable Python & Pycharm
  python = false;

  # Enable SyncThing
  # syncthing = false;

}
