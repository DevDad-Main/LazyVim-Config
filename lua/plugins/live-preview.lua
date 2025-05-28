return {
  {
    "brianhuster/live-preview.nvim",
    config = function()
      require("live-preview").setup({
        -- OPTIONAL: override default settings here
        -- Example:
        -- port = 8080,
        -- browser_command = "firefox",
        -- lsp_servers = { "html", "cssls" },
      })
    end,

    keys = {
      { "<leader>lp", ":LivePreview start<cr>", desc = "Start Live Preview" },
    },
  },
}
