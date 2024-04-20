{...}:{
  programs.nixvim = {
    enable = true;
    opts = {
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2;        # Tab width should be 2
    };
    colorschemes.gruvbox.enable = true;
    plugins = {
      #lightline.enable = true;
      lualine.enable = true;
      cmp = {
	enable = true;
	settings = {
	  autoEnableSources = true;
	  snippet = {expand = "luasnip";};
	  sources = [
	    {name = "nvim_lsp";}
	    {
            name = "path"; # file system paths
            keywordLength = 3;
	    }
	    {
            name = "luasnip"; # snippets
            keywordLength = 3;
	    }
	  ];
	};
      };
      cmp-nvim-lsp = {enable = true;}; # lsp
      cmp_luasnip = {enable = true;}; # snippets
      cmp-path = {enable = true;}; # file system paths
      lsp-format = {enable = true;};
      lsp = {
	enable = true;
	servers = {
	  pyright = {enable = true;};
	  lua-ls = {enable = true;};
	  nil_ls = {enable = true;};
	  gopls = {enable = true;};
	  tsserver = {enable = false;};
	  html = {enable = true;};
	};
      };
    }; 
  };
}
