{ pkgs, username, host, ... }:

let inherit (import ../hosts/${host}/options.nix) theShell;
in {
  users.users = {
    "${username}" = {
      homeMode = "755";
      hashedPassword = "$6$jVJNdoKK19Ze9hMd$xXKi4arfDsm8ZiPyd9qb6xoBGcJVRovBXT1VDuvMPkqdoTfIaktF15kmK1hpKlRFD2TQyhbOLYcE1mAoLLS0f1";
      isNormalUser = true;
      description = "gitUsername";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.${theShell};
      ignoreShellProgramCheck = true;
      packages = with pkgs; [];
    };
    # "newuser" = {
    #    homeMode = "755";
    #    hashedPassword = "";
    #    you can get this by: $ mkpassd -m sha-512 <password>
    #    ...
    # };
  };
}
