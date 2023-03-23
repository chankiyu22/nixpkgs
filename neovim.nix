{ config, pkgs, lib, ... }:

let
  mason-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "mason.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "williamboman";
      repo = "mason.nvim";
      rev = "b3c82a23b26818e18e20036452bdcf7821ddc37d";
      sha256 = "sha256-+3ppOoOVpguK6ghE3KByGnY2j5GpaxGmOGwmTBT3bfE=";
    };
    buildPhase = ''
      echo "Skip build phase"
    '';
  };

  mason-lspconfig-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "mason-lspconfig.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "e8bd50153b94cc5bbfe3f59fc10ec7c4902dd526";
      sha256 = "sha256-BHUw/LUVxfw5XWjW5EYMAyTmnRpuvt+duoOkHjJO878=";
    };
    buildPhase = ''
      echo "Skip build phase"
    '';
  };

  mason-null-ls-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "mason-null-ls.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "jay-babu";
      repo = "mason-null-ls.nvim";
      rev = "0fcc40394b8d0f525a8be587268cbfac3e70a5bc";
      sha256 = "sha256-gUnG3kCNHc7aTOR5844zQwdNsDhi0uuVHT/n36NGXJg=";
    };
  };

in
{
  xdg.configFile."nvim/lua/plugins".source = lib.cleanSource ./neovim/plugins;
  xdg.configFile."nvim/lua/theme.lua".source = lib.cleanSource ./neovim/theme.lua;
  xdg.configFile."nvim/settings.lua".source = lib.cleanSource ./neovim/settings.lua;

  programs.neovim = {

    enable = true;

    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      luafile ~/.config/nvim/settings.lua
    '';

    extraPackages = with pkgs; [
      # js/ts
      nodePackages.typescript
      nodePackages.typescript-language-server

      tree-sitter
    ];

    plugins = with pkgs.vimPlugins; [
      gitsigns-nvim
      indent-blankline-nvim
      lazygit-nvim
      nvim-autopairs
      nvim-tree-lua
      nvim-ts-autotag
      nvim-treesitter
      nvim-treesitter-context
      nvim-web-devicons
      telescope-nvim
      vim-commentary
    ] ++ [
      # lsp
      null-ls-nvim
      nvim-code-action-menu
      nvim-lspconfig
    ] ++ [
      # manage lsp
      mason-nvim
      mason-lspconfig-nvim
      mason-null-ls-nvim
    ] ++ [
      # cmp
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      cmp-vsnip
      vim-vsnip
      lspkind-nvim
    ] ++ [
      # theme
      lualine-nvim
      tokyonight-nvim
    ];
  };
}
