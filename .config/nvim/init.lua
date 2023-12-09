vim.cmd("colorscheme molokai")
vim.g.molokai_original = 1

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.lazyredraw = true
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.backspace = "2"
vim.opt.showmatch = true
vim.opt.virtualedit = "onemore"
vim.opt.laststatus = 2
vim.opt.colorcolumn = "80"

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- share clipboard with other tmux/terminal panes
vim.opt.clipboard = "unnamed"

-- custom keybindings
vim.g.mapleader =' '

-- buffer
vim.keymap.set('n', '<leader>l', ':bnext<cr>')
vim.keymap.set('n', '<leader>h', ':bprevious<cr>')
vim.keymap.set('n', '<leader>q', ':bp <BAR> bd #<cr>')

-- loc list
vim.keymap.set('n', '<leader>lo', ':lopen<cr>')
vim.keymap.set('n', '<leader>lc', ':lclose<cr>')

-- clear search highlighting on Esc
vim.keymap.set('n', '<esc>', ':noh<cr>')

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- LSP
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {'williamboman/mason-lspconfig.nvim'},
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    },
    init = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local cmp = require('cmp')
      local luasnip  = require('luasnip')
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ['<tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  if #cmp.get_entries() == 1 then
                    cmp.confirm({ select = true })
                  else
                    cmp.select_next_item()
                  end
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end, { 'i', 's' }),
          ['<s-tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<cr>'] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }
        })
      })

      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities
            })
          end
        }
      });
    end,
    keys = {
      {'<leader>d', vim.lsp.buf.declaration},
      {'<leader>t', vim.lsp.buf.hover},
      {'<leader>r', vim.lsp.buf.rename},
      {'<leader>f', vim.lsp.buf.formatting},
    },
  },
  -- Chrome
  -- tabline/statusline
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      --options = { theme = require('lualine.themes.powerline_dark') },
      tabline = {
        lualine_a = {'buffers'},
      }
    },
  },
  -- git status in line numbers
  {
    'lewis6991/gitsigns.nvim',
  },

  -- fzf
  {
    'ibhagwan/fzf-lua',
    keys = {
      { '<leader>[', '<cmd>lua require("fzf-lua").buffers()<cr>' },
      { '<leader>]', '<cmd>lua require("fzf-lua").files({ cmd = "rg --files --no-ignore --hidden --follow --glob \'!.git/*\'"})<cr>' },
      { '<leader>\\', '<cmd>lua require("fzf-lua").grep()<cr>' }
    }
  },
  -- Fugitive
  -- Prettier
  -- vim-better-whitespace
})
