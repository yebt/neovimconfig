-- git interactions
return {
  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    -- event = { "BufRead" },
    event = { "VeryLazy" },
    config = require("plugin.config.gitsigns"),
  },
}
