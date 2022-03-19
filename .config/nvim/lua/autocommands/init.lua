-- set keyboard layout to EN on insert leave
vim.cmd([[
  function! SetUsLayout()
    silent !xkbswitch -se ABC > /dev/null
  endfunction

  autocmd InsertLeave * call SetUsLayout()
]])

-- vim.cmd([[
--   function! AutoWipeBuf()
--     set hidden
--     set bufhidden=wipe
--   endfunction
--   " autocmd BufReadPost * call AutoWipeBuf()
--   autocmd BufNew * call AutoWipeBuf()
--   ]])

-- vim.cmd([[
--   augroup _general_settings
--     autocmd!
--     autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
--     autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
--     autocmd BufWinEnter * :set formatoptions-=cro
--     autocmd FileType qf set nobuflisted
--   augroup end
--
--   augroup _git
--     autocmd!
--     autocmd FileType gitcommit setlocal wrap
--     autocmd FileType gitcommit setlocal spell
--   augroup end
--
--   augroup _markdown
--     autocmd!
--     autocmd FileType markdown setlocal wrap
--     autocmd FileType markdown setlocal spell
--   augroup end
--
--   augroup _auto_resize
--     autocmd!
--     autocmd VimResized * tabdo wincmd =
--   augroup end
--
--   augroup _alpha
--     autocmd!
--     autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
--   augroup end
-- ]])

-- fix does't work in other files
vim.cmd("hi CursorLine term=bold cterm=bold guibg=Grey32")

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
