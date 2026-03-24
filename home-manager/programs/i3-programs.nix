{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    betterlockscreen
    blueman
    brightnessctl
    conky
    feh
    glava
    lxappearance
    pcmanfm
    picom-pijulius
    polybar
    pywal
    rofi
    sxiv
    xclip
    pcre
  ];

}
