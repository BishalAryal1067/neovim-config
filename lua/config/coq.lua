--coq for autocomplete
return {
    { "ms-jpq/coq_nvim", branch = "coq" }, --main autocomplete engine
    { "ms-jpq/coq.artifacts", branch = "artifacts" }, --additional 9000+ snippets
    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    { 'ms-jpq/coq.thirdparty', branch = "3p" },

    config = function()
    vim.g.coq_settings = {
        auto_start = true, 
    }
   end,
}
