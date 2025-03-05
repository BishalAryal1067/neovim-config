--get the larger plugins
local lazy = require("config.lazy")
local treesitter = require("config.treesitter")
local mason_lsp = require("config.mason_lsp")

--locally configured plugins
local kanagawa = {
   "rebelot/kanagawa.nvim",
   config = function ()
    vim.cmd.colorscheme("kanagawa-wave")
  end,
}

local text_objects =  {
        "nvim-treesitter/nvim-treesitter-textobjects"
}

local lsp_config = {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
        end,
}

local mason =  {
        "williamboman/mason.nvim",
        config = function()
            local mason = require("mason")
            mason.setup({})
        end,
}

local web_dev_icons =  { "nvim-tree/nvim-web-devicons", opts = {}}

--create a plugins table
local plugins = {
  kanagawa, --colorscheme plugin
  treesitter, --treesitter for neovim
  text_objects,
  lsp_config,
  mason,
  mason_lsp,
  web_dev_icons
}

--initialize the lazy.nvim with necessary plugins
lazy.setup(plugins)



