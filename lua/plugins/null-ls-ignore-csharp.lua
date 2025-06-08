-- Disable null-ls for C# files in LazyVim
return {
  "nvimtools/none-ls.nvim", -- this is what LazyVim uses for null-ls
  opts = function(_, opts)
    local original_on_attach = opts.on_attach
    opts.on_attach = function(client, bufnr)
      local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
      if ft == "cs" then
        vim.schedule(function()
          client.stop()
        end)
        return
      end
      if original_on_attach then
        original_on_attach(client, bufnr)
      end
    end
  end,
}
