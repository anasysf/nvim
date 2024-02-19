local ok, Comment = pcall(require, 'Comment')
if not ok then
  return vim.notify('COULD NOT LOAD COMMENT', vim.log.levels.ERROR, { title = 'COMMENT' })
end

Comment.setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
}
