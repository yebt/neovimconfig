return function()
  -- vim.o.timeout = true
  -- vim.o.timeoutlen = 300
  require("which-key").setup({
    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0.6 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
      padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      zindex = 1000, -- positive value to position WhichKey above other floating windows.
    },
    layout = {
      height = { min = 4, max = 45 }, -- min and max height of the columns
      width = { min = 20, max = 60 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
  })
end
