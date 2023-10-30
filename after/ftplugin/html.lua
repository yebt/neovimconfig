-- complete tags with omnifunc
vim.opt.omnifunc = "htmlcomplete#CompleteTags"
-- go to file
function gotofilehtml(fname)
  return require("utils.functions").gotofile_html(fname)
end
vim.opt.includeexpr = "v:lua.gotofilehtml(v:fname)"
