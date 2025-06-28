-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/luasnip.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/luasnip.lua

-- This allows me to create my custom snippets
-- All you need to do, if using the lazyvim.org distro, is to enable the
-- coding.luasnip LazyExtra and then add this file

-- If you're a dotfiles scavenger, definitely watch this video (you're welcome)
-- https://youtu.be/FmHhonPjvvA?si=8NrcRWu4GGdmTzee

return {
  "L3MON4D3/LuaSnip",
  enabled = true,
  opts = function(_, opts)
    local ls = require("luasnip")

    -- Add prefix ";" to each one of my snippets using the extend_decorator
    -- I use this in combination with blink.cmp. This way I don't have to use
    -- the transform_items function in blink.cmp that removes the ";" at the
    -- beginning of each snippet. I added this because snippets that start with
    -- a symbol like ```bash aren't having their ";" removed
    -- https://github.com/L3MON4D3/LuaSnip/discussions/895
    -- NOTE: THis extend_decorator works great, but I also tried to add the ";"
    -- prefix to all of the snippets loaded from friendly-snippets, but I was
    -- unable to do so, so I still have to use the transform_items in blink.cmp
    local extend_decorator = require("luasnip.util.extend_decorator")
    -- Create trigger transformation function
    local function auto_semicolon(context)
      if type(context) == "string" then
        return { trig = ";" .. context }
      end
      return vim.tbl_extend("keep", { trig = ";" .. context.trig }, context)
    end
    -- Register and apply decorator properly
    extend_decorator.register(ls.s, {
      arg_indx = 1,
      extend = function(original)
        return auto_semicolon(original)
      end,
    })
    local s = extend_decorator.apply(ls.s, {})

    -- local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local rep = require("luasnip.extras").rep

    -- local function clipboard()
    --   return vim.fn.getreg("+")
    -- end

    -- -- Path to the text file containing video snippets
    -- local snippets_file = vim.fn.expand("~/github/obsidian_main/300-youtube/youtube-video-list.txt")
    --
    -- -- Check if the file exists before proceeding
    -- if vim.fn.filereadable(snippets_file) == 1 then
    --   -- Base function to process YouTube snippets with custom formatting
    --   local function process_youtube_snippets(file_path, format_func)
    --     local snippets = {}
    --     local file = io.open(file_path, "r")
    --     if not file then
    --       vim.notify("Could not open snippets file: " .. file_path, vim.log.levels.ERROR)
    --       return snippets
    --     end
    --
    --     local lines = {}
    --     for line in file:lines() do
    --       if line == "" then
    --         if #lines == 2 then
    --           local raw_title, url = lines[1], lines[2]
    --           -- Removed spaces and any other special characters as I was having
    --           -- issues triggering the snippets
    --           local trig_title = raw_title:gsub("[^%w]", "")
    --           local formatted_content = format_func(trig_title, raw_title, url)
    --           table.insert(snippets, formatted_content)
    --         end
    --         lines = {}
    --       else
    --         table.insert(lines, line)
    --       end
    --     end
    --
    --     -- Handle the last snippet if file doesn't end with blank line
    --     if #lines == 2 then
    --       local raw_title, url = lines[1], lines[2]
    --       -- Removed spaces and any other special characters as I was having
    --       -- issues triggering the snippets
    --       local trig_title = raw_title:gsub("[^%w]", "")
    --       local formatted_content = format_func(trig_title, raw_title, url)
    --       table.insert(snippets, formatted_content)
    --     end
    --
    --     file:close()
    --     return snippets
    --   end

    -- -- Format functions for different types of YouTube snippets
    -- local format_functions = {
    --   plain = function(trig_title, title, url)
    --     return s({ trig = "yt" .. trig_title }, { t(title), t({ "", url }) })
    --   end,
    --
    --   markdown = function(trig_title, title, url)
    --     local safe_title = string.gsub(title, "|", "-")
    --     local markdown_link = string.format("[%s](%s)", safe_title, url)
    --     return s({ trig = "ytmd" .. trig_title }, { t(markdown_link) })
    --   end,
    --
    --   markdown_external = function(trig_title, title, url)
    --     local safe_title = string.gsub(title, "|", "-")
    --     local markdown_link = string.format('[%s](%s){:target="_blank"}', safe_title, url)
    --     return s({ trig = "ytex" .. trig_title }, { t(markdown_link) })
    --   end,
    --
    --   -- Extract video ID from URL (everything after the last /)
    --   embed = function(trig_title, _, url)
    --     local video_id = url:match(".*/(.*)")
    --     local embed_code = string.format("{%% include embed/youtube.html id='%s' %%}", video_id)
    --     return s({ trig = "ytem" .. trig_title }, { t(embed_code) })
    --   end,
    -- }
    --
    -- -- Generate all types of snippets using the base function
    -- local video_snippets = process_youtube_snippets(snippets_file, format_functions.plain)
    -- local video_md_snippets = process_youtube_snippets(snippets_file, format_functions.markdown)
    -- local video_md_snippets_ext = process_youtube_snippets(snippets_file, format_functions.markdown_external)
    -- local video_snippets_embed = process_youtube_snippets(snippets_file, format_functions.embed)
    --
    -- -- Add all types of snippets to the "all" filetype
    -- ls.add_snippets("all", video_snippets)
    -- ls.add_snippets("all", video_md_snippets)
    -- ls.add_snippets("all", video_md_snippets_ext)
    -- ls.add_snippets("all", video_snippets_embed)
    -- else
    --   vim.notify("YouTube snippets file not found, skipping loading.", vim.log.levels.INFO)
    -- end
    -- Custom snippets
    -- the "all" after ls.add_snippets("all" is the filetype, you can know a
    -- file filetype with :set ft
    -- Custom snippets

    -- Helper function to create code block snippets
    local function create_code_block_snippet(lang)
      return s({
        trig = lang,
        name = "Codeblock",
        desc = lang .. " codeblock",
      }, {
        t({ "```" .. lang, "" }),
        i(1),
        t({ "", "```" }),
      })
    end

    -- Define languages for code blocks
    local languages = {
      "txt",
      "lua",
      "sql",
      "go",
      "regex",
      "bash",
      "markdown",
      "markdown_inline",
      "yaml",
      "json",
      "jsonc",
      "cpp",
      "csv",
      "java",
      "javascript",
      "python",
      "dockerfile",
      "html",
      "css",
      "templ",
      "php",
    }

    -- Generate snippets for all languages
    local snippets = {}

    for _, lang in ipairs(languages) do
      table.insert(snippets, create_code_block_snippet(lang))
    end

    table.insert(
      snippets,
      s({
        trig = "prettierignore",
        name = "Add prettier ignore start and end headings",
        desc = "Add prettier ignore start and end headings",
      }, {
        t({
          " ",
          "<!-- prettier-ignore-start -->",
          " ",
          "> ",
        }),
        i(1),
        t({
          " ",
          " ",
          "<!-- prettier-ignore-end -->",
        }),
      })
    )

    -- Basic Python script template
    table.insert(
      snippets,
      s({
        trig = "pythonex",
        name = "Basic Python script example",
        desc = "Simple Python script template",
      }, {
        t({
          "```python",
          "#!/usr/bin/env python3",
          "",
          "def main():",
          "    print('helix dizpython')",
          "",
          "if __name__ == '__main__':",
          "    main()",
          "```",
          "",
        }),
      })
    )

    ls.add_snippets("markdown", snippets)

    -- We can use the tab to jump from the one input to the other
    local js_snippets = {}

    table.insert(
      js_snippets,
      s({
        trig = "helloworld",
        name = "Hello World JS",
        desc = "JS Hello World Arrow Function",
      }, {
        t("const helloWorld = ("),
        i(1, "param"),
        t({ ") => {", "  return 'hello ' + " }),
        rep(1), -- Dynamically reuses the input from node 1
        t({ ";", "};", "console.log(hello(" }),
        i(2),
        t("));"),
      })
    )

    ls.add_snippets("javascript", js_snippets)

    return opts
  end,
}
