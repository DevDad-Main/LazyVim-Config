return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- Default options:
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}

-- return {
--   "zenbones-theme/zenbones.nvim",
--   -- Optionally install Lush. Allows for more configuration or extending the colorscheme
--   -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
--   -- In Vim, compat mode is turned on as Lush only works in Neovim.
--   dependencies = "rktjmp/lush.nvim",
--
--   priority = 1000,
--   lazy = false,
--   -- you can set set configuration options here
--   config = function()
--     vim.g.zenbones_darken_comments = 45
--     vim.g.zenbones_compat = 0
--     vim.cmd.colorscheme("zenbones")
--   end,
-- }
--
-- return {
--   {
--     "anAcc22/sakura.nvim",
--     dependencies = "rktjmp/lush.nvim",
--     config = function()
--       vim.opt.background = "dark" -- or "light"
--       vim.cmd("colorscheme sakura") -- sets the colorscheme
--     end,
--   },
-- }

-- return {
--   {
--     "datsfilipe/vesper.nvim",
--     priority = 1000,
--     lazy = false,
--     config = function()
--       vim.cmd.colorscheme("vesper")
--     end,
--   },
-- }
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     require("rose-pine").setup({
--       --variant = "auto", -- auto, main, moon, or dawn
--       variant = "moon", -- auto, main, moon, or dawn
--       dark_variant = "moon", -- main, moon, or dawn
--       dim_inactive_windows = false,
--       extend_background_behind_borders = true,
--
--       enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true, -- Handle deprecated options automatically
--       },
--
--       styles = {
--         bold = true,
--         italic = true,
--         transparency = false,
--       },
--
--       groups = {
--         border = "muted",
--         link = "iris",
--         panel = "surface",
--
--         error = "love",
--         hint = "iris",
--         info = "foam",
--         note = "pine",
--         todo = "rose",
--         warn = "gold",
--
--         git_add = "foam",
--         git_change = "rose",
--         git_delete = "love",
--         git_dirty = "rose",
--         git_ignore = "muted",
--         git_merge = "iris",
--         git_rename = "pine",
--         git_stage = "iris",
--         git_text = "rose",
--         git_untracked = "subtle",
--
--         h1 = "iris",
--         h2 = "foam",
--         h3 = "rose",
--         h4 = "gold",
--         h5 = "pine",
--         h6 = "foam",
--       },
--
--       palette = {
--         -- Override the builtin palette per variant
--         -- moon = {
--         --     base = '#18191a',
--         --     overlay = '#363738',
--         -- },
--       },
--
--       -- NOTE: Highlight groups are extended (merged) by default. Disable this
--       -- per group via `inherit = false`
--       highlight_groups = {
--         --Comment = { fg = "foam" },
--         StatusLine = { fg = "love", bg = "love", blend = 15 },
--         VertSplit = { fg = "muted", bg = "muted" },
--         -- Visual = { fg = "base", bg = "text", inherit = false },
--       },
--
--       before_highlight = function(group, highlight, palette)
--         -- Disable all undercurls
--         -- if highlight.undercurl then
--         --     highlight.undercurl = false
--         -- end
--         --
--         -- Change palette colour
--         -- if highlight.fg == palette.pine then
--         --     highlight.fg = palette.foam
--         -- end
--       end,
--     })
--
--     --vim.cmd("colorscheme rose-pine")
--     -- vim.cmd("colorscheme rose-pine-main")
--     vim.cmd("colorscheme rose-pine-moon")
--     -- vim.cmd("colorscheme rose-pine")
--   end,
-- }
--
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   lazy = false,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha", -- latte, frappe, macchiato, mocha
--       transparent_background = true,
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         treesitter = true,
--         -- add more integrations as needed
--       },
--     })
--     vim.cmd.colorscheme("catppuccin")
--   end,
-- }
