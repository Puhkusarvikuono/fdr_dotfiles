return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  config = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compiler_latexmk = {
			aux_dir = "./.latexmk/aux",
			out_dir = "./.latexmk/out",
		}
  end,
  keys = {
    { "<localLeader>l", "", desc = "+vimtex" },
  },
}
