{ config, pkgs, ... }:

let
  imports = [
    ./neovim.nix
    ./tmux.nix
  ];
in {
  inherit imports;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kchan";
  home.homeDirectory = "/Users/kchan";

  home.packages = with pkgs; [
    fd
    git-filter-repo
    inetutils
    lazygit
    openfortivpn
    ripgrep
    tmux
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
