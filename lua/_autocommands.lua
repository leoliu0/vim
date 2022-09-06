vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd InsertEnter,InsertLeave * set cul!
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
autocmd VimLeave config.h !sudo make clean install
autocmd VimLeave *.tex !just todo
augroup prewrites
    autocmd!
    autocmd FileWritePre *.tex :%s/\s\+$//e | %s/\r$//e | %s/\s\./\./e
    autocmd FileWritePre *.tex silent! lua vim.lsp.buf.formatting()
augroup END 
autocmd BufWrite *.py execute ':Black'
autocmd BufWrite *.html,*.lua silent! lua vim.lsp.buf.formatting()

autocmd FileType py map ,, <leader>r
autocmd FileType rs map ,, <leader>r
autocmd FileType go map ,, :GoRun<CR>
autocmd FileType sil map ,, :!sile %<CR><CR>
autocmd FileType v map ,, :!v run %
autocmd FileType tex nmap ,, :w!<CR>:VimtexCompile<CR>
autocmd FileType tex nmap ` :VimtexView<CR>
autocmd FileType html,css nmap ,, <C-y>,
autocmd FileType ms nmap ,, !pdf %
autocmd BufNewFile,BufRead *.ms nmap ,, m:!pdf %<ENTER><ENTER>
autocmd BufNewFile,BufRead *.md nmap ,, m:!pdf %<ENTER><ENTER>

]])
