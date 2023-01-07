{ config, pkgs, lib, ... }:

{
  xdg.configFile."nvim/settings.lua".source = lib.cleanSource ./neovim/settings.lua;

  programs.neovim = {

    enable = true;

    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      luafile ~/.config/nvim/settings.lua
    '';

    plugins = with pkgs.vimPlugins; [
      # indentation
      indent-blankline-nvim
    ];
  };
}
