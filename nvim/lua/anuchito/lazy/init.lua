return {
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



