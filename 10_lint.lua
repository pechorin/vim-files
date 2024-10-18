local nvim_lint = {
  file_pattern  = {"*.rb", "*.erb", "*.haml"},
  linters_by_ft = {
    ruby = {'rubocop'}
  }
}

require('lint').linters_by_ft = nvim_lint.linters_by_ft

local pattern = nvim_lint.file_pattern or { "*.rb", "*.erb", "*.haml", "*.slim" }

vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead" }, {
  pattern = pattern,
  callback = function()
    require("lint").try_lint()
  end,
})
