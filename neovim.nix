{ config, pkgs, lib, ... }:

{
  xdg.configFile."nvim/settings.lua".source = lib.cleanSource ./neovim/settings.lua;
  xdg.configFile."nvim/lua/plugins".source = lib.cleanSource ./neovim/plugins;

  programs.neovim = {

    enable = true;

    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      luafile ~/.config/nvim/settings.lua
    '';

    plugins = with pkgs.vimPlugins; [
      indent-blankline-nvim
      nvim-treesitter
      telescope-nvim
    ];
  };
}
