{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      udev-gothic-nf
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];

    fontconfig.defaultFonts = {
      sansSerif = [ "Noto Sans CJK JP" ];
      serif = [ "Noto Serif CJK JP" ];
      monospace = [ "UDEV Gothic NF" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
