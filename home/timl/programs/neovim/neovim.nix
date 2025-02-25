{ pkgs, lib, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs;[
      sumneko-lua-language-server
      nil
      rust-analyzer
      kotlin-language-server
      clang-tools
      go
      gopls
      clang
      nodejs_23
      pyright
      csharp-ls
      jdt-language-server
      haskell-language-server
    ] ++ (with pkgs.nodePackages; [
      bash-language-server
      vscode-langservers-extracted
      typescript-language-server
      svelte-language-server
    ]);
    plugins = with pkgs.vimPlugins;
      let
        transparent = pkgs.vimUtils.buildVimPlugin {
          name = "vim-better-whitespace";
          src = pkgs.fetchFromGitHub {
            owner = "xiyaowong";
            repo = "transparent.nvim";
            rev = "f09966923f7e329ceda9d90fe0b7e8042b6bdf31";
            sha256 = "sha256-Z4Icv7c/fK55plk0y/lEsoWDhLc8VixjQyyO6WdTOVw=";
          };
        };
      in
      [
        nvim-treesitter
        nvim-treesitter.withAllGrammars
        nvim-lspconfig
        copilot-lua

        onedark-nvim
        transparent

        lsp_lines-nvim
        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        cmp-treesitter
        luasnip
        cmp_luasnip
        friendly-snippets
        formatter-nvim

        comment-nvim
        vim-surround
        vim-repeat

        telescope-nvim
        telescope-fzf-native-nvim
        harpoon

        undotree
        vim-fugitive
        gitsigns-nvim
        git-blame-nvim
        nvim-jdtls
      ];
    extraLuaConfig = lib.strings.concatStringsSep "\n"
      (lib.attrsets.mapAttrsToList
        (name: value:
          "require('timl.${lib.strings.removeSuffix ".lua" name}')"
        )
        (builtins.readDir ./config)
      ++ [
      ]);
  };
  xdg.configFile."nvim/lua/timl" = {
    source = ./config;
  };
}
