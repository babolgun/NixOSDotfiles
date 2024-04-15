{config, lib, pkgs, host, ... }:
let inherit (import ../../hosts/${host}/options.nix) flakeDir flakePrev
             flakeBackup theShell hostname;
in lib.mkIf (theShell == "bash") {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;
    profileExtra = ''
      #if [ z "$DISPLAY" ] && [ "$XDG_VNTR" = 1 ]; then
      # exec Hyprland
      #fi
    '';
    initExtra = ''
      neofetch
      if [ -f $HOME/.bashrc]; then
        source $HOME/.bashrc
      fi
    '';
    sessionVariables = {
      BABOL_OS = true;
      FLAKEBACKUP = "${flakeBackup}";
      FLAKEPREV = "${flakePrev}";
    };
    shellAliases = {
      sv="sudo nvim";
      flake-rebuild="nh os switch --hostname ${hostname}";
      flake-update="nh os switch --hostname ${hostname} --update";
      gcCleanup="nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      v="nvim";
      ls="lsd";
      ll="lsd -a";
      lal="lsd -al";
      ".."="cd ..";
      # neofetch="neofetch --ascii ~/.config/ascii-neofetch";
    };
  };
}