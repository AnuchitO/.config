return {
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    },
    config = function(_, opts)
      require('mason').setup(opts)

      -- Setup mason-lspconfig
      local mr = require('mason-registry')
      local function ensure_installed()
        local servers = {
          -- LSP servers
          'lua-language-server',  -- lua_ls
          'typescript-language-server',  -- tsserver
          'pyright',
          'gopls',  -- Go language server
          'json-lsp',
          'css-lsp',
          'html-lsp',
          'yaml-language-server',
          'bash-language-server'
        }

        for _, server in ipairs(servers) do
          local ok, p = pcall(mr.get_package, server)
          if ok and not p:is_installed() then
            p:install()
          end
        end
      end

      -- Use a timer to ensure packages are installed after Mason is fully loaded
      vim.defer_fn(function()
        if pcall(require, 'mason-registry') then
          ensure_installed()
        end
      end, 1000)
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('mason-lspconfig').setup({
        automatic_installation = true,
      })
    end,
  },
}
