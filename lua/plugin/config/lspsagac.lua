return function ()
  local lspsaga = require("lspsaga")
  local opts = {
    symbol_in_winbar = {
      enable = false,
    },
    code_action = {
      num_shortcut = true,
      show_server_name = true,
      extend_gitsigns = false
    }
  }

  lspsaga.setup(opts)
end
