-- Set colorscheme once at first profile load, not after reloading profile
if _G.profile_loads == 0 then
  vim.opt.bg = 'light'
  vim.cmd.colorscheme 'adwaita'
end
