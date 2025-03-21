return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
            require'nvim-treesitter.configs'.setup({
              ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
              sync_install = false,
              auto_install = true,
              ignore_install = { "javascript" },

              highlight = {
                enable = true,
                disable = { "c", "rust" },
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                additional_vim_regex_highlighting = false,
              },

              indent = {
                  enable = true
              },

              incremental_selection = {
                        enable = true,
                        keymaps = {
                          init_selection = "<Leader>ss", -- set to `false` to disable one of the mappings
                          node_incremental = "<Leader>sg",
                          scope_incremental = "<Leader>sc",
                          node_decremental = "<Leader>sd",
                       },
              },

              textobjects = {
                select = { 
                  enable = true,
                      lookahead = true,
                      keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                     },
                     selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V', -- linewise
                    ['@class.outer'] = '<c-v>', -- blockwise
                    },
                   include_surrounding_whitespace = true,
              },
            },
            })
        end,
}
