-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set options
vim.o.number = true
vim.o.relativenumber = false
vim.o.ignorecase = true
vim.o.smartcase = true

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")

-- Setup plugins
require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- File tree explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = {
                    side = "left",
                    width = 30,
                },
            })
        end,
    },

    -- Telescope fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
})

-- Set colorscheme
vim.g.catppuccin_flavour = "mocha" -- optional: latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]

-- Keybindings
-- Leader + e to toggle file tree explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file tree" })

-- Leader + ff to open Telescope find files
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true, desc = "Telescope find files" })
