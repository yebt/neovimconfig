--

local function has_capability(capability, filter)
  for _, client in ipairs(vim.lsp.get_active_clients(filter)) do
    if client.supports_method(capability) then
      return true
    end
  end
  return false
end
-- 
-- 
local function add_buffer_autocmd(augroup, bufnr, autocmds)
  if not vim.tbl_islist(autocmds) then
    autocmds = { autocmds }
  end
  local cmds_found, cmds = pcall(vim.api.nvim_get_autocmds, { group = augroup, buffer = bufnr })
  if not cmds_found or vim.tbl_isempty(cmds) then
    vim.api.nvim_create_augroup(augroup, { clear = false })
    for _, autocmd in ipairs(autocmds) do
      local events = autocmd.events
      autocmd.events = nil
      autocmd.group = augroup
      autocmd.buffer = bufnr
      vim.api.nvim_create_autocmd(events, autocmd)
    end
  end
end

--
local function del_buffer_autocmd(augroup, bufnr)
  local cmds_found, cmds = pcall(vim.api.nvim_get_autocmds, { group = augroup, buffer = bufnr })
  if cmds_found then
    vim.tbl_map(function(cmd)
      vim.api.nvim_del_autocmd(cmd.id)
    end, cmds)
  end
end

------------
vim.diagnostic.config({
  update_in_insert = true,

  float = {
    focused = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
