opt = vim.opt
cmd = vim.cmd
g = vim.g
api = vim.api

opt.number = true
opt.relativenumber = true
opt.splitright = true
opt.splitbelow = true
opt.wrap = false
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.virtualedit = "all"
opt.clipboard = "unnamedplus"
opt.scrolloff = 999
opt.inccommand = "split"
opt.ignorecase = true
opt.termguicolors = true

g.mapleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

--autostart the COQ plugin for autocompletion on neovim startup
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("COQnow --shut-up")
    end,
})

--setup formatting
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then return end

        ---@diagnostic disable-next-line: missing-parameter
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = args.buf,
                        id = client.id
                    })
                end

            })
        end
    end
})
