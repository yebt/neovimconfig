return function()
  local ok, hardtime = pcall(require, "hardtime")
  if not ok then
    return
  end

  local opts = {
    disable_mouse = false,

    -- Add "oil" to the disabled_filetypes
    disabled_filetypes = {
      "NvimTree",
      "TelescopePrompt",
      "aerial",
      "alpha",
      "checkhealth",
      "dapui-repl",
      "dapui_breakpoints",
      "dapui_console",
      "dapui_scopes",
      "dapui_stacks",
      "dapui_watches",
      "DressingInput",
      "DressingSelect",
      "help",
      "lazy",
      "NeogitStatus",
      "NeogitLogView",
      "mason",
      "neotest-summary",
      "minifiles",
      "neo-tree",
      "neo-tree-popup",
      "netrw",
      "noice",
      "notify",
      "prompt",
      "qf",
      "oil",
      "undotree",
    },
    disabled_keys = {
      ["<Up>"] = { "n", "i" },
      ["<Down>"] = { "n", "i" },
      ["<Left>"] = { "n", "i" },
      ["<Right>"] = { "n", "i" },
    },
  }
  hardtime.setup(opts)
end
