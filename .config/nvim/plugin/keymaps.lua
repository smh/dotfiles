local set = vim.keymap.set

set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })
-- set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location" })
set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location" })

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

set("n", "]d", vim.diagnostic.goto_next)
set("n", "[d", vim.diagnostic.goto_prev)


-- Toggle hlsearch if it's on, otherwise just do "enter"
-- set("n", "<CR>", function()
--   ---@diagnostic disable-next-line: undefined-field
--   if vim.v.hlsearch == 1 then
--     vim.cmd.nohl()
--     return ""
--   else
--     return k "<CR>"
--   end
-- end, { expr = true })

-- set("n", "<M-,>", "<c-w>5<")
-- set("n", "<M-.>", "<c-w>5>")
-- set("n", "<M-t>", "<c-w>5+")
-- set("n", "<M-s>", "<c-w>5-")
