" https://github.com/spf13/spf13-vim/issues/789
augroup ftplugin_options
  autocmd BufEnter <buffer> set tabstop=2 expandtab shiftwidth=2 softtabstop=2
  autocmd BufWinEnter <buffer> set tabstop=2 expandtab shiftwidth=2 softtabstop=2
augroup END

