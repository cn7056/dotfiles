-- init.lua
vim.wo.number = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.loop or vim.uv).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- lazy.nvim setup
require("lazy").setup({
  spec = {
    { "folke/tokyonight.nvim" }, -- theme plugin
    {
     'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
})

-- Set colorscheme
vim.cmd([[colorscheme tokyonight]])
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Find files' })
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR> path=%:p:h select_buffer=true<CR>")

