{ colorScheme, ... }:
{
  vim = {
    theme = {
      enable = true;
      # Looks bad :(
      # name = "base16";
      # base16-colors = colorScheme.palette;
      name = "catppuccin";
      style = "mocha";
    };

    statusline = {
      lualine = {
        enable = true;
      };
    };

    tabline.nvimBufferline = {
      enable = true;
      setupOpts = {
        options = {
          numbers = "none";
          tab_size = 14;
          pick.alphabet = "abcdefghijklmnopqrstuvwxyzæøåABCDEFGHIJKLMNOPQRSTUVWXYZÆØÅ";
        };
      };
      mappings = {
        cycleNext = "<tab>";
        cyclePrevious = "<S-tab>";
        moveNext = "<C-.>";
        movePrevious = "<C-,>";
      };
    };

    visuals = {
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };

    ui = {
      noice.enable = true;
      modes-nvim.enable = true;
    };

  };
}
