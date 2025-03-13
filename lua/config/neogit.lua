return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "ibhagwan/fzf-lua", 
    },

    config = function ()
                local neogit = require("neogit")
                neogit.setup({})
         end,
}
