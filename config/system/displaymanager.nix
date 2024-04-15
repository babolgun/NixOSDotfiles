{ pkgs, config, host, ... }:

let inherit (import ../../hosts/${host}/options.nix) theKBDVariant
              theKBDLayout theSecondKBDLayout;
in {
  services.xserver = {
    enable = true;
    xkb = {
      variant = "${theKBDVariant}";
      layout = "${theKBDLayout}";
    };
    libinput.enable = true;
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "tokio-night-sddm";
    };
  };

  environment.systemPackages = 
    let 
      sugar = pkgs.callPackage ../sddm/sddm-sugar-dark.nix {};
      tokyo-night = pkgs.libsForQt5.callPackage ../sddm/sddm-tokyo-night.nix {};
    in [
      sugar.sddm-sugar-dark
      tokyo-night
      pkgs.libsForQt5.qt5.qtgraphicaleffects
    ];
}
