vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("smh-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "CurSearch", timeout = 300, })
  end,
})
