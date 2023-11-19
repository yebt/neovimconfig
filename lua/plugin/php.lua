return {
  {
    "gbprod/phpactor.nvim",
    event = "VeryLazy",
    build = function()
      require("phpactor.handler.update")()
    end, -- To install/update phpactor when installing this plugin
    dependencies = {
      "nvim-lua/plenary.nvim", -- required to update phpactor
      "neovim/nvim-lspconfig", -- required to automaticly register lsp serveur
    },
  },
}
