 return {
   "williamboman/mason-lspconfig.nvim",
   dependencies = { "mason.nvim" },
   config = function()
            local mason_lsp = require("mason-lspconfig")
            mason_lsp.setup({})
            mason_lsp.setup_handlers({
               function(server_name)
                 require("lspconfig")[server_name].setup({})
               end,
            })
        end,
}
