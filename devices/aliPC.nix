{ config, pkgs, lib, home-manager, ... }:

## aliPC laptop specific settings.


{
  imports = [
    home-manager.nixosModules.home-manager
    ../users/ali/ali.nix
    ../hardware-configuration.nix
  
  ];


  #boot.kernelPackages = pkgs.linuxPackages_latest; 

  # Hardware settings.
  hardware = {
    
    # OpenGL
    graphics = {
      enable = true;
    };


    # Firmware
    enableAllFirmware = true;

    # Bluetooth.
    bluetooth = {
      enable = true;
      powerOnBoot = true;

      settings = {
        General = {
          Experimental = true;
          KernelExperimental = true;
        };
      };

    };

    # CPU microcode

  };

  # Networking
  networking.hostName = "aliPC";
  networking.networkmanager.enable = true;


  # Use the systemd-boot EFI boot loader.
  #boot.loader.timeout = 0;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = {"vm.swappiness" = 5;}; 


  };




   swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 8*1024;
  } ];

  
}
