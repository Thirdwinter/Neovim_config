return {
  vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true }),

  vim.api.nvim_set_keymap("n", "<A-i>", "<cmd>m .-2<cr>==", { noremap = true, silent = true }),
  vim.api.nvim_set_keymap("n", "<A-k>", "<cmd>m .+1<cr>==", { noremap = true, silent = true }),

  vim.api.nvim_set_keymap("i", "<A-i>", "<esc><cmd>m .-2<cr>==gi", { noremap = true, silent = true }),
  vim.api.nvim_set_keymap("i", "<A-k>", "<esc><cmd>m .+1<cr>==gi", { noremap = true, silent = true }),

  vim.api.nvim_set_keymap("v", "<A-i>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }),
  vim.api.nvim_set_keymap("v", "<A-k>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }),
}
