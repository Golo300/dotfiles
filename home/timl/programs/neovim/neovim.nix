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
      nodejs_24
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

        golf = pkgs.vimUtils.buildVimPlugin {
          name = "golf";
          src = pkgs.fetchFromGitHub {
            owner = "vuciv";
            repo = "golf";
            rev = "89f6ca2a4f3db62057ae45aea7ff5730f0f32e83";
            sha256 = "sha256-bH+6GupGNhpeqnvX5cQxBbAIU6RAU30k++k3hK8GrmM=";
          };
        };
      in
      [
        nvim-treesitter
        nvim-treesitter.withAllGrammars
        nvim-lspconfig
        copilot-lua

        dracula-nvim
        transparent
        golf
        neo-tree-nvim

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
