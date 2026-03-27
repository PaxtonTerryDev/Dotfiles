return {
  "saghen/blink.cmp",
  opts = {
    snippets = {
      preset = "default",
      -- Load custom snippets from this directory
      paths = { vim.fn.stdpath("config") .. "/snippets" },
    },
  },
}
