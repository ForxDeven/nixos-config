{ lib, config, pkgs, ... }:
{

  programs.plasma = {
    enable = true;
    
    workspace = {
      clickItemTo = "select"; # If you liked the click-to-open default from plasma 5
      splashScreen.theme = "None";

    };

    hotkeys = {
      commands = {
        "launch-konsole" = {
          name = "Launch Konsole";
          key = "Meta+Return";
          command = "konsole";
        };
        "launch-firefox" = {
          name = "launch firefox";
          key = "Meta+F";
          command = "firefox";
        };
        "launch-yakuake" = {
          name = "launch yakuake";
          key = "Meta+Shift+Y";
          command = "yakuake";
        };
      };
    };

    input = {
      touchpads = [ # cat /proc/bus/input/devices
        {  # zenbook touchpad
          #name = "ASUE140D:00 04F3:31B9 Touchpad";
          #productId = "31b9";
          #vendorId = "04f3";
          enable = true;
          disableWhileTyping = true;
          naturalScroll = true;
          scrollSpeed = 1;
        }
      ];
    };


    panels = [
      ######## panel 1 starts here #########
      {
        location = "bottom";
        height = 28;
        widgets = [
          # main menu applet
          {
            name = "org.kde.plasma.kickoff";
          }
          # icons task manager
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General.launchers = [
                #"applications:org.kde.dolphin.desktop"
                #"applications:org.kde.konsole.desktop"
              ];
            };
          }
          # separator
          "org.kde.plasma.marginsseparator"
          #"org.kde.plasma.weather"
          # clock
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
            };
          }
          # battery 
          {
            battery = {
              showPercentage = true;
            };
          }
          # system tray items
          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              shown = [
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
                "org.kde.plasma.notifications"
              ];
              # And explicitly hide networkmanagement and volume
              hidden = [
                "org.kde.plasma.brightness"
                "org.kde.plasma.battery"
              ];
            };
          }
        ];
        hiding = "dodgewindows";
      }
      ########### panel 1 ends here. ###############
    ];

    kscreenlocker = {
      appearance.wallpaperSlideShow = { path = "/home/memeth/wallpapers/regular/"; };
    };

    # Some mid-level settings:
    #
    shortcuts = {
      ksmserver = {
        "Lock Session" = [ "Screensaver" "Meta+L" ];
      };
      kwin = {
        "Expose" = "Meta+,";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";
      };
    };


    #
    # Some low-level settings:
    #
    configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;
      kwinrc."org.kde.kdecoration2".ButtonsOnLeft = "SF";
      kwinrc.Desktops.Number = {
        value = 8;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
    };
  };



}
