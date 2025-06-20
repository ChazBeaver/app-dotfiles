-- ~/.config/nvim/lua/themes/init.lua
-- Loads default theme and provides :Theme command

local loader = require("themes.loader")
local apply = require("themes.apply")

-- Read the active theme from file
local theme_file = vim.fn.stdpath("config") .. "/colors/active"
local file = io.open(theme_file, "r")
local default_name = file and file:read("*l") or "realtree"
if file then file:close() end

-- Load default theme on startup
local colors = loader.parse(default_name)
apply.apply(colors)
vim.g.colors_name = default_name

-- Define :Theme <name> command
vim.api.nvim_create_user_command("Theme", function(opts)
  local name = opts.args
  local colors = loader.parse(name)
  if not next(colors) then return end
  apply.apply(colors)
  vim.g.colors_name = name
end, {
  nargs = 1,
  complete = function()
    local dir = vim.fn.stdpath("config") .. "/colors"
    local files = vim.fn.globpath(dir, "*.sh", false, true)
    return vim.tbl_map(function(f)
      return vim.fn.fnamemodify(f, ":t:r")
    end, files)
  end,
})
