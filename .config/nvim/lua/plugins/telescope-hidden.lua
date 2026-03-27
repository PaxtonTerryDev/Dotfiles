return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>s.",
        function()
          require("telescope.builtin").live_grep({
            additional_args = { "--hidden", "--glob", "!.git" },
          })
        end,
        desc = "Grep (Hidden Files)",
      },
      {
        "<leader>f.",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
            file_ignore_patterns = { ".git/" },
          })
        end,
        desc = "Find Files (Hidden)",
      },
    },
  },
}
