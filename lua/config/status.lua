local opt = vim.opt

local statusline_str=''
local tabline_str=''

--
local padding = '%#Normal# %0*' -- xpadding
local separator = '%=' -- separator

--
function append_v(v, chrl, chrr, vl)
  if v and v ~= '' then
    return chrl .. v .. chrr .. ' '
  else
    return vl or ''
  end
end

function lazyupdates()
  local ok, lst = pcall(require, 'lazy.status')
  if not ok or not (lst.has_updates()) then
    return ''
  end
  return ' ' .. require('lazy.status').updates() .. ' '
end



--
stts_str = padding
  .. "%1*%{ v:lua.append_v(get(b:,'gitsigns_head',''),'  [', ']')}%0*"
  -- .. ' %<%f '
  -- .. '%h%m%r'
  .. separator
  -- diagnostic
  .. separator
  --.. '%2*%{v:lua.Lazyupdates()}%0*' -- Updates
  .. '%2*%{v:lua.lazyupdates()}%0*'
  .. ' %2l/%L:%c '
  .. '%{ mode() }'
  .. padding

--
tabline_str = ''
tabline_str = '%0*%#TabLine#%#TabLineSel#> %<%f %h%m%r %0*'

--
opt.statusline = stts_str
opt.tabline = tabline_str
