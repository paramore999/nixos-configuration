{ config, pkgs, xdnUser, xdnVersion, xdnHost, xdnHome, ... }:

{
  # User
  users.users.${xdnUser} = {
    isNormalUser = true;
    description = "paramore";
    initialPassword = "Limerence5272";
    group = "users";
    extraGroups = [ 
      "wheel" 
      "disk" 
      "audio" 
      "video" 
      "networkmanager" 
      "systemd-journal" 
      "vboxusers" 
      "adbusers" 
      "docker"
      "username-with-access-to-socket"
      "dialout"
    ];
    shell = pkgs.zsh;
  };
}
