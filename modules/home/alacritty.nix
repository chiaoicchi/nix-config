{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        dimensions = {
          columns = 181;
          lines = 80;
        };
        padding = {
          x = 8;
          y = 4;
        };
      };

      cursor = {
        style = "Beam";
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      font = {
        size = 12.0;

        normal = {
          family = "Hack Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "Hack Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "Hack Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "Hack Nerd Font";
          style = "Bold Italic";
        };

        offset = {
          x = 0;
          y = 1;
        };
      };

      colors = {
        primary = {
          background = "#282c34";
          foreground = "#abb2bf";
        };
        normal = {
          black = "#1e2127";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#abb2bf";
        };
        bright = {
          black = "#5c6370";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#d19a66";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#ffffff";
        };
      };
    };
  };
}
