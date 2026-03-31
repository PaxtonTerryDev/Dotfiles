local function get_codelldb_executable()
  local cwd = vim.fn.getcwd()

  local cargo_toml = cwd .. "/Cargo.toml"
  if vim.uv.fs_stat(cargo_toml) then
    for line in io.lines(cargo_toml) do
      local name = line:match('^name%s*=%s*"(.-)"')
      if name then
        local debug_path = cwd .. "/target/debug/" .. name
        if vim.uv.fs_stat(debug_path) then
          return debug_path
        end
      end
    end
  end

  local build_dirs = { "build", "bin", "out", "." }
  for _, dir in ipairs(build_dirs) do
    local full = cwd .. "/" .. dir
    if vim.uv.fs_stat(full) then
      local handle = vim.uv.fs_scandir(full)
      if handle then
        while true do
          local name, typ = vim.uv.fs_scandir_next(handle)
          if not name then
            break
          end
          if typ == "file" then
            local path = full .. "/" .. name
            local stat = vim.uv.fs_stat(path)
            if stat and bit.band(stat.mode, tonumber("111", 8)) ~= 0 and not name:match("%.") then
              return path
            end
          end
        end
      end
    end
  end

  return vim.fn.input("Executable path: ", cwd .. "/", "file")
end

local function get_go_executable()
  local cwd = vim.fn.getcwd()
  local mod_file = cwd .. "/go.mod"
  if vim.uv.fs_stat(mod_file) then
    for line in io.lines(mod_file) do
      local name = line:match("^module%s+(.+)")
      if name then
        local parts = vim.split(name, "/")
        local bin_name = parts[#parts]
        local bin_path = cwd .. "/" .. bin_name
        if vim.uv.fs_stat(bin_path) then
          return bin_path
        end
      end
    end
  end
  return vim.fn.input("Executable path: ", cwd .. "/", "file")
end

return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      dap.adapters.godot = {
        type = "server",
        host = "127.0.0.1",
        port = 6006,
      }

      dap.configurations.gdscript = {
        {
          type = "godot",
          request = "launch",
          name = "Launch Godot",
          project = "${workspaceFolder}",
        },
      }

      dap.configurations.c = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = get_codelldb_executable,
          cwd = "${workspaceFolder}",
        },
      }
      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c

      dap.configurations.go = {
        {
          name = "Launch",
          type = "delve",
          request = "launch",
          program = get_go_executable,
          cwd = "${workspaceFolder}",
        },
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "codelldb", "delve" },
    },
  },
}
