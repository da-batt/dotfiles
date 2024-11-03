vim.g.mapleader = " "

-- Diagnostics
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>")

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
