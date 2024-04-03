if exists('g:loaded_lsp')
    call LspAddServer([#{ name: 'marksman', filetypes: ['markdown'], path: 'marksman', args: ['server'], syncInit: v:true}])
end
