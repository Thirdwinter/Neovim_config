if true then return {} end
return {
  "j-hui/fidget.nvim",
  tag = "v1.0.0", -- Make sure to update this to something recent!
  opts = {
    -- Options related to Neovim's built-in LSP client
    lsp = {
      progress_ringbuf_size = 5, -- Configure the nvim's LSP progress ring buffer size
      log_handler = true, -- Log `$/progress` handler invocations (for debugging)
    },
  },
}
