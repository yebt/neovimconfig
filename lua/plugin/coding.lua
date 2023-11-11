-- This plugins contain the main needes to edit code
return {
  -- Toggle comments
  {
    "tpope/vim-commentary",
    keys = {
      { "gc", mode = { "x", "n" }, desc = "Toggle comment" },
    },
  },

  -- Split and Join
  {
    'echasnovski/mini.splitjoin',
    version = false,
    config = require("plugin.config.mini_splitjoin"),
    keys={
      {"gS"}
    }
  },

  -- Tabular
  {
    "godlygeek/tabular",
    cmd = "Tabularize",
    -- /,/r1c1l0
    -- https://devhints.io/tabular
  }

}
