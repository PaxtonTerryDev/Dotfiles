return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>f.",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = true,
            file_ignore_patterns = { "%.git/" },
          })
        end,
        desc = "Find Files (hidden)",
      },
      {
        "<leader>s.",
        function()
          require("telescope.builtin").live_grep({
            additional_args = { "--hidden", "--no-ignore", "--glob", "!.git/" },
          })
        end,
        desc = "Grep (hidden)",
      },
    },
  },
}
