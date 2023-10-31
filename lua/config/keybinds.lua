local map = vim.keymap.set

-- Functions
----------------------------

-- Add blank space above
local blank_above = function()
  vim.cmd("put! =repeat(nr2char(10), v:count1)|silent ']+")
end

-- Add blank space below
local blank_below = function()
  vim.cmd("put =repeat(nr2char(10), v:count1)|silent '[-")
end

local homeVsKey = function()
  local col = vim.fn.col(".")
  local line = vim.api.nvim_get_current_line()
  local nonBlankColumn = vim.fn.match(line, "\\S") + 1
  if col == nonBlankColumn then
    action = "g0"
  else
    action = "^"
  end
  return action
end

-- Remove buffer
local brem = function()
  -- if there are less than 2
  if vim.fn.winnr("$") < 2 then
    vim.cmd("bw")
    return
  end
  -- there are at least 2 windows
  -- if there are less that 2 bufers
  if vim.fn.bufnr("$") < 2 then
    vim.cmd("enew")
  end
  vim.cmd("bn |  bw #")
end

-- Toggle netrw
local toggleNetrw = function()
  -- Verificar si el buffer de netrw ya está abierto
  local netrw_buf_exists = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, "filetype") == "netrw" then
      netrw_buf_exists = true
      break
    end
  end

  -- Abrir Vexprore si el buffer de netrw no está abierto
  if not netrw_buf_exists then
    --vim.cmd("Vexplore")
    vim.cmd("Explore %:p:h")
  else
    -- Obtener el número del buffer actual
    local current_buf = vim.api.nvim_get_current_buf()

    -- Verificar si el buffer actual es netrw
    if vim.api.nvim_buf_get_option(current_buf, "filetype") == "netrw" then
      -- Cerrar el buffer actual
      vim.cmd("bd")
    else
      -- Enfocar el buffer de netrw
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.api.nvim_buf_get_option(buf, "filetype") == "netrw" then
          vim.api.nvim_set_current_win(win)
          break
        end
      end
    end
  end
end

-- Maps
----------------------------

-- Map 0 key like home in vscode
map("n", "0", homeVsKey, { silent = true, expr = true })
-- Add spaces blow and above
map("n", "[<space>", blank_above, { silent = true, desc = "Blank above" })
map("n", "]<space>", blank_below, { silent = true, desc = "Blank below" })
-- quit
map("n", "<leader>q", ":q<CR>", { silent = true, desc = "Quit of nvim" })
-- write
map("n", "<leader>w", ":w<CR>", { silent = true, desc = "Save buffer" })
-- Esc with Ctrl+c
map({ "x", "i", "n" }, "<C-c>", "<ESC>", { silent = true, desc = "Stop on esc" })
-- Make splits
map("n", "<M-Bar>", ":vsplit<cr>", { silent = true, desc = "Vertical split" })
map("n", "<M-->", ":split<cr>", { silent = true, desc = "Horizontal split" })
-- Move around splits
map("n", "<M-h>", "<C-w>h", { silent = true, desc = "Move to left split" })
map("n", "<M-l>", "<C-w>l", { silent = true, desc = "Move to right split" })
map("n", "<M-k>", "<C-w>k", { silent = true, desc = "Move to up split" })
map("n", "<M-j>", "<C-w>j", { silent = true, desc = "Move to down split" })
-- Move between buffers
map("n", "<M-d>", ":bn<cr>", { silent = true, desc = "Go to next buffer" })
map("n", "<M-a>", ":bp<cr>", { silent = true, desc = "Go to prev buffer" })
map("n", "<M-s>", ":b#<cr>", { silent = true, desc = "Go to # buffer" })
-- map("n", "]b", ":bn<cr>", { silent = true, desc = "Go to next buffer" })
-- map("n", "[b", ":bp<cr>", { silent = true, desc = "Go to next buffer" })
-- map("n", "[B", ":b#<cr>", { silent = true, desc = "Go to next buffer" })
-- Remove buffer
map("n", "<M-c>", brem, { silent = true, desc = "Delete buffer" })
-- Select all
map("n", "<leader>a", "ggVG", { silent = true, desc = "select all content" })
-- Paste witouth lost the primary register
map("x", "<leader>p", '"_dP', { silent = true, desc = "Paste without losee content" })
-- Yank on system clipboard
map("x", "<leader>y", '"+y', { silent = true, desc = "Copy con clipboard" })
-- Indent
map("x", "<", "<gv", { silent = true, desc = "Indent -" })
map("x", ">", ">gv", { silent = true, desc = "Indebt +" })
-- Move selected lines below or above
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection up" })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection down" })
-- Surround
map("x", "<C-s>", function()
  local char_code = vim.fn.getchar()
  local char = vim.fn.nr2char(char_code)
  if char == "\x03" or char == "\x1b" then
    return
  end
  local surrounds = {
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ["<"] = ">",
    -- ' " ` = are the same
  }
  local pair_char = surrounds[char] or char
  return "c" .. char .. '<C-r><C-o>"' .. pair_char .. "<ESC><Left>vi" .. char
end, { silent = true, expr = true, desc = "Add surround" })
-- Toggle 
map("n", "\\", toggleNetrw, { silent = true })
-- NoH
map({ "n", "x" }, "<leader>h", ":noh<CR>", { silent = true })
-- Terminal esc
map("t", "<ESC>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })
-- Toggler Wrap
map("n", "<M-z>w", ":set wrap!<CR>", { silent = true })
