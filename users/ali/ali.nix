{ config, pkgs, lib, home-manager, systemFlake, plasma-manager, ... }:

{

  imports = [ # My modules for things that needs to be installed/enabled system-wide or cannot be configured by home-manager.
    ./modules/fonts.nix
    ./modules/packages.nix
    ./modules/services.nix
    ./modules/vim.nix
    #./modules/gnome.nix
    ./modules/kde.nix
    ./modules/xorg.nix
    ./modules/games.nix
  ];

  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "tr_q-latin5";
  };

    # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ali = {
    isNormalUser = true;
    home = "/home/ali";
    description = "Ali Altuntaş";
    extraGroups = ["wheel" "storage" "mlocate" "video" "audio" "input" "systemd-journal" "networkmanager"]; # Enable ‘sudo’ for the user.
  };
  


  # My home-manager modules.
  home-manager = {
    extraSpecialArgs = {
      inherit systemFlake;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
    users.ali = lib.mkMerge [
      (
        { config, pkgs, ... }:
        {
          home.stateVersion = "24.05";
          imports = [
            ./home/bash.nix
            ./home/git.nix
            #./home/kate.nix
            #./home/konsole.nix
            #./home/plasma.nix
          ];
        }
      )
    ];
  };



  system.stateVersion = "22.11"; # Did you read the comment?

  
}

