local treesitter = require("nvim-treesitter")

-- Enable Treesitter highligh to all filetypes that there are parsers for.
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    if
        -- is arg2 in arg1
        vim.list_contains(
          -- all installed parsers
          treesitter.get_installed(),
          -- get parser for current language
          vim.treesitter.language.get_lang(args.match)
        )
    then
      vim.treesitter.start(args.buf)
    end
  end,
})

-- Treesitter folding
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
vim.o.foldlevelstart = 20 -- start folded if more than 20
vim.wo[0][0].foldnestmax = 3
vim.wo[0][0].foldminlines = 5

-- Treesitter indentation
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
