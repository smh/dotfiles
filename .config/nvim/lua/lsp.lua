local lspconfig = require 'lspconfig'

-- local buf_map = function(bufnr, mode, lhs, rhs, opts)
--     vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
--         silent = true,
--     })
-- end

local on_attach = function(client, bufnr)
    vim.cmd 'command! LspDef lua vim.lsp.buf.definition()'
    vim.cmd 'command! LspFormatting lua vim.lsp.buf.formatting()'
    vim.cmd 'command! LspCodeAction lua vim.lsp.buf.code_action()'
    vim.cmd 'command! LspHover lua vim.lsp.buf.hover()'
    vim.cmd 'command! LspRename lua vim.lsp.buf.rename()'
    vim.cmd 'command! LspRefs lua vim.lsp.buf.references()'
    vim.cmd 'command! LspTypeDef lua vim.lsp.buf.type_definition()'
    vim.cmd 'command! LspImplementation lua vim.lsp.buf.implementation()'
    vim.cmd 'command! LspDiagPrev lua vim.diagnostic.goto_prev()'
    vim.cmd 'command! LspDiagNext lua vim.diagnostic.goto_next()'
    vim.cmd 'command! LspDiagLine lua vim.diagnostic.open_float()'
    vim.cmd 'command! LspSignatureHelp lua vim.lsp.buf.signature_help()'
    nnoremap('gd', ':LspDef<CR>', nil, bufnr)
    nnoremap('gr', ':LspRename<CR>', nil, bufnr)
    nnoremap('gy', ':LspTypeDef<CR>', nil, bufnr)
    nnoremap('K', ':LspHover<CR>', nil, bufnr)
    nnoremap('[a', ':LspDiagPrev<CR>', nil, bufnr)
    nnoremap(']a', ':LspDiagNext<CR>', nil, bufnr)
    nnoremap('ga', ':LspCodeAction<CR>', nil, bufnr)
    nnoremap('<Leader>a', ':LspDiagLine<CR>', nil, bufnr)
    inoremap('<C-x><C-x>', '<cmd> LspSignatureHelp<CR>', nil, bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
    end
end

lspconfig.tsserver.setup {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require 'nvim-lsp-ts-utils'
        ts_utils.setup {}
        ts_utils.setup_client(client)
        nnoremap('gs', ':TSLspOrganize<CR>', nil, bufnr)
        nnoremap('gi', ':TSLspRenameFile<CR>', nil, bufnr)
        nnoremap('go', ':TSLspImportAll<CR>', nil, bufnr)
        on_attach(client, bufnr)
    end,
}

local null_ls = require 'null-ls'
null_ls.setup {
    sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.prettier
    },
    on_attach = on_attach
}
