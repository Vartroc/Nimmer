{ pkgs, inputs', ... }:
{
  vim = {
    lazy.plugins = {
      "vimplugin-blink-emoji.nvim" = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "blink-emoji.nvim";
          src = inputs'.plugin-blink-emoji;
          dependencies = [ pkgs.vimPlugins.blink-cmp ];
        };
      };

      "vimplugin-blink-cmp-spell" = {
        package = pkgs.vimUtils.buildVimPlugin {
          name = "blink-cmp-spell";
          src = inputs'.plugin-blink-cmp-spell;
          dependencies = [ pkgs.vimPlugins.blink-cmp ];
        };
      };

      "blink.cmp" = {
        package = pkgs.vimPlugins.blink-cmp;
        # event = [ "LspAttach" ];
        # ft = [ "markdown" ];
        event = [ "BufEnter" ];
        setupModule = "blink.cmp";

        setupOpts = {
          keymap =
            let
              fallback = a: [
                a
                "fallback"
              ];
            in
            {
              preset = "none";
              "<C-n>" = fallback "select_next";
              "<C-r>" = fallback "select_prev";
              "<CS-n>" = fallback "scroll_documentation_down";
              "<CS-r>" = fallback "scroll_documentation_up";
              "<C-space>" = [
                "show"
                "show_documentation"
                "hide_documentation"
              ];
              "<C-e>" = [ "hide" ];
              "<C-y>" = [ "select_and_accept" ];
            };

          # TODO when luasnip
          # snippets.preset = "luasnip";

          sources = {
            default = [
              "lsp"
              "path"
              # "snippets"
              "buffer"
              "emoji"
            ];
            cmdline = [ ];

            providers = {
              emoji = {
                name = "Emoji";
                module = "blink-emoji";
              };

              spell = {
                name = "Spell";
                module = "blink-cmp-spell";
              };
            };
          };

          completion = {
            menu = {
              auto_show = true;
            };

            documentation = {
              auto_show = true;
              auto_show_delay_ms = 500;
            };

            ghost_text.enabled = true;
          };
        };
      };
    };
  };
}
