if exists('g:loaded_lsp')
  call LspAddServer([#{ name: 'marksman', filetype: ['markdown'], path: '/path/to/marksman', args: ['server'], syncInit: v:true }])
end
