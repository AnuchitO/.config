return {
    -- {
    --     "neovim/nvim-lspconfig",
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "williamboman/mason-lspconfig.nvim",
    --         "jose-elias-alvarez/null-ls.nvim",
    --         "hrsh7th/cmp-nvim-lsp",
    --         "hrsh7th/cmp-buffer",
    --         "hrsh7th/cmp-path",
    --         "hrsh7th/cmp-cmdline",
    --         "hrsh7th/nvim-cmp",
    --         "L3MON4D3/LuaSnip",
    --         "saadparwaiz1/cmp_luasnip",
    --     },
    --     config = function()
    --         require("anuchito.lazy.lsp")
    --     end,
    -- },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "gopls",
                    "tsserver",
                    "rust_analyzer",
                    "html",
                    "cssls",
                    "jsonls",
                    "lua_ls"
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            -- Configuration is handled in lsp/init.lua
        end,
    },
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    "eandrju/cellular-automaton.nvim",
}



