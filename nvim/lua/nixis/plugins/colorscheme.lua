-- nixis.plugins.colorscheme
--
-- This file sets up the colorscheme for Neovim.
-- It is configured to use pywal, but can be easily changed.

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Ensure it loads first
  config = function()
    -- Set the colorscheme
    vim.cmd.colorscheme "catppuccin"
  end,
}

