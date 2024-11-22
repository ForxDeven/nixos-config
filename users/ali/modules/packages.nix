{ config, lib, pkgs, ... }:

  let
    my-python-packages = p: with p; [
      pandas
      seaborn
      matplotlib
      numpy
      openpyxl
      jupyter
    ];
  in

  with pkgs;
  let
    R-with-my-packages = rWrapper.override{ packages = with rPackages; [ tidyverse quarto ggplot2 sf rworldmap magrittr leaflet dplyr rvest xml2 maps mapdata RgoogleMaps lubridate rnaturalearth rnaturalearthdata RColorBrewer httr rmarkdown knitr shiny parallel sqldf ];};
    RStudio-with-my-packages = rstudioWrapper.override{ packages = with rPackages; [ tidyverse quarto ggplot2 sf rworldmap magrittr leaflet dplyr rvest xml2 maps mapdata RgoogleMaps lubridate rnaturalearth rnaturalearthdata RColorBrewer httr rmarkdown knitr shiny parallel sqldf ];};
  in



{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  users.users.ali.packages =
  
    with pkgs; [
      wget
      neofetch
      htop
      libreoffice
      linuxHeaders
      mlocate
      lm_sensors
      smartmontools
      dmidecode
      ntfs3g
      acpi
      android-file-transfer
      usbutils
      zip
      unzip
      tree
      rar
      pciutils
      killall
      parted
      openssl
      discord
      spotify
      google-chrome
      vlc
      (pkgs.python3.withPackages my-python-packages)
	  R-with-my-packages
	  RStudio-with-my-packages
      vscode
    ];

    programs = {
      firefox = {
        enable = true;
      };





}
