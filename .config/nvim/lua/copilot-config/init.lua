-- use Shift-t to trigger accept copilot
vim.cmd('imap <silent><script><expr> <M-Tab> copilot#Accept("<CR>")')
vim.cmd("let g:copilot_no_tab_map = v:true")
