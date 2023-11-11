-- git interactions
return {
  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead" },
    config = require("plugin.config.gitsigns"),
  },
}
