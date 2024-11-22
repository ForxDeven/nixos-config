{ config, pkgs, lib, home-manager, ... }:

{
    # Declare bash aliases.
    programs.bash = {

      enable = true;
      
      shellAliases = {
        cl = "clear";
        pkgs = "sudo vim /etc/nixos/users/ali/modules/packages.nix";
        v = "vim";
        sv = "sudo vim";
        ht = "htop";
        ll = "ls --color=auto -lashX";
        up = "cd ..";
        py = "python";
        wttr = "curl wttr.in";
        switch = "sudo nixos-rebuild switch --flake /etc/nixos#";
        update = "sudo nix flake update --flake /etc/nixos";
        configure = "sudo vim /etc/nixos/configuration.nix";
        r = "R";
        stats-shell = "nix develop $HOME/devshells#stats-shell";
        docs-shell = "nix develop $HOME/devshells#docs-shell";
        py-shell = "nix develop $HOME/devshells#py-shell";
        r-shell = "nix develop $HOME/devshells#r-shell";
        rstudio-shell = "nix develop $HOME/devshells#rstudio-shell";
        julia-shell = "nix develop $HOME/devshells#julia-shell";
        psql-shell = "nix develop $HOME/devshells#psql-shell";
        btt = "bluetoothctl";
        btton = "bluetoothctl power on";
        bttoff = "bluetoothctl power off";
        neo = "neofetch";
        bat = "acpi -V";
        errors = "journalctl -p 3 -b";
      };



  };

}
