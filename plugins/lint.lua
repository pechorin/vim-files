require('lint').linters_by_ft = {
  -- markdown = {'vale',}
  ruby = {'rubocop'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = {"*.rb", "*.erb", "*.haml", "*.slim"},
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = {"*.rb", "*.erb", "*.haml", "*.slim"},
  callback = function()
    require("lint").try_lint()
  end,
})
