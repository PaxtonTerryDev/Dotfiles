local theme_file = vim.fn.stdpath("config") .. "/lua/plugins/theme.lua"
if vim.fn.filereadable(theme_file) == 1 then
  return {}
end

local data_file = vim.fn.stdpath("data") .. "/theme.json"
local default_colorscheme = "tokyonight"

local function read_theme()
  if vim.fn.filereadable(data_file) == 0 then
    return default_colorscheme
  end
  local ok, content = pcall(vim.fn.readfile, data_file)
  if not ok then
    return default_colorscheme
  end
  local decoded = vim.json.decode(table.concat(content, "\n"))
  return decoded and decoded.colorscheme or default_colorscheme
end

local function save_theme(colorscheme)
  local dir = vim.fn.fnamemodify(data_file, ":h")
  vim.fn.mkdir(dir, "p")
  vim.fn.writefile({ vim.json.encode({ colorscheme = colorscheme }) }, data_file)
end

local function get_available_themes()
  local themes = {}
  local ok, all_themes = pcall(require, "plugins.all-themes")
  if not ok then
    return themes
  end
  for _, spec in ipairs(all_themes) do
    local key = spec.name or (spec[1] and spec[1]:match("[^/]+$")) or spec[1]
    local plugin = require("lazy.core.config").plugins[key]
    if plugin and plugin.dir then
      local colors_dir = plugin.dir .. "/colors"
      if vim.fn.isdirectory(colors_dir) == 1 then
        for _, file in ipairs(vim.fn.readdir(colors_dir)) do
          local name = file:match("(.+)%.vim$") or file:match("(.+)%.lua$")
          if name then
            table.insert(themes, name)
          end
        end
      end
    end
  end
  table.sort(themes)
  return themes
end

vim.api.nvim_create_user_command("ThemeSelect", function()
  local themes = get_available_themes()
  if #themes == 0 then
    vim.notify("No themes found", vim.log.levels.WARN)
    return
  end
  vim.ui.select(themes, { prompt = "Select theme:" }, function(choice)
    if not choice then
      return
    end
    require("lazy.core.loader").colorscheme(choice)
    pcall(vim.cmd.colorscheme, choice)
    save_theme(choice)
    vim.notify("Theme set to " .. choice)
  end)
end, {})

local colorscheme = read_theme()

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorscheme,
    },
  },
}
