{ config, pkgs, ... }:

{
  # Aktiviere Neovim
  programs.neovim.enable = true;

  programs.neovim.plugins = with pkgs.vimPlugins; [
    nvim-lspconfig
    nvim-treesitter.withAllGrammars
    plenary-nvim
    gruvbox-material
    mini-nvim
    vim-sleuth
    nerdtree
    dashboard-nvim
  ];

  home.file.".config/nvim/init.vim".text = ''
    
        " ### Darstellungsoptionen
    syntax on           " Syntax Highlighting aktiveren
    set number          " Line Numbers anzeigen
    set relativenumber  " Relative Nummerierung anzeigen
    set linebreak       " Ganze Wörter in neue Zeile umbrechen
    set showmode        " Aktuellen Modus in Statuszeile anzeigen
    set scrolloff=5     " Cursor bei Scroll weiter oben halten
    set mouse=a         " Scrollen mit der Mouse in Console und tmux
    set lazyredraw      " Weniger Redraws bei Macros und co.
    set updatetime=300  " Schellere Darstellung	/ Refresh
    "set cc=80          " Markierung 80 Zeilen-Rand
    set laststatus=2    " Statuszeile immer anzeigen
    set cmdheight=2     " Mehr Platz für Statusmeldungen
    set shortmess+=c    " Don't pass messages to |ins-completion-menu|
    set nowrap          " Wrap standardmäßig abschalten. Mit Leader w an-/abschalten
    autocmd VimEnter * NERDTree
    autocmd VimEnter * NERDTree
    '';
}
