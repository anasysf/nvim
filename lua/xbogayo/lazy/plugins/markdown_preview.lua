return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  config = function()
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    keymap.set('n', '<leader>mp', ':MarkdownPreviewToggle<CR>', opts)
  end,
}
