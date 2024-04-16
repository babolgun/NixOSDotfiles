{ pkgs, config, username, host, ... }:

let inherit (import ../../hosts/${host}/options.nix) browser wallpaperDir wallpaperGit flakeDir;
in {
  # Install Packages For the User
  # Omitted: discord(chat), transmission-gtk(bit-torrent), obs-studio(videorecording), protonup-qt, spotify
  home.packages = with pkgs; [     
    pkgs."${browser}" libvirt swww grim slurp gnome.file-roller lunarvim
    swaynotificationcenter rofi-wayland imv mpv gimp rustup xfce.thunar
    audacity pavucontrol tree font-awesome swayidle neovide swaylock
    git-credential-manager dotnet-runtime_7
    (nerdfonts.override { fonts = ["JetBrainsMono"]; })
    # Import scripts
    (import ./../scripts/emopicker9000.nix { inherit pkgs; })
    (import ./../scripts/task-waybar.nix { inherit pkgs; })
    (import ./../scripts/squirtle.nix { inherit pkgs; })
    (import ./../scripts/wallsetter.nix { inherit pkgs; inherit wallpaperDir;
      inherit username; inherit wallpaperGit; })
    (import ./../scripts/themechange.nix { inherit pkgs; inherit flakeDir; inherit host; })
    (import ./../scripts/theme-selector.nix { inherit pkgs; })
    (import ./../scripts/web-search.nix { inherit pkgs; })
    (import ./../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ./../scripts/screenshootin.nix { inherit pkgs; })
    (import ./../scripts/list-hypr-bindings.nix { inherit pkgs; inherit host; })
  ];

  programs.gh.enable = true;
}
