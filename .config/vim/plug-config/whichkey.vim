nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

"nnoremap <silent> g :silent <c-u> :silent WhichKey 'g'<CR> 

" Create map to add keys to
let g:which_key_leader_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" highlight default link WhichKey          Operator
highlight default link WhichKeySeperator Comment
" highlight default link WhichKeyGroup     Identifier
" highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
" let g:which_key_leader_map['/'] = [ ':call Comment()'            , 'comment' ]
" let g:which_key_leader_map['.'] = [ ':e $MYVIMRC'                , 'open init' ]
" let g:which_key_leader_map[';'] = [ ':Commands'                  , 'commands' ]
" let g:which_key_leader_map['='] = [ '<C-W>='                     , 'balance windows' ]
" let g:which_key_leader_map[','] = [ 'Startify'                   , 'start screen' ]
" let g:which_key_leader_map.d = [ ':bd'                        , 'delete buffer']
let g:which_key_leader_map.n = [ ':NERDTreeFind'              , 'explorer' ]
let g:which_key_leader_map.m = [ ':NERDTreeToggle'            , 'explorer' ]
" let g:which_key_leader_map.f = [ ':Files'                     , 'search files' ]
let g:which_key_leader_map.h = 'split below'
let g:which_key_leader_map.p = 'format'
let g:which_key_leader_map.P = 'format selection'
" let g:which_key_leader_map.q = [ 'q'                          , 'quit' ]
" let g:which_key_leader_map.r = [ ':RnvimrToggle'              , 'ranger' ]
" let g:which_key_leader_map.S = [ ':SSave'                     , 'save session' ]
" let g:which_key_leader_map.T = [ ':Rg'                        , 'search text' ]
let g:which_key_leader_map.v = 'split right'

" Group mappings

" a is for actions
let g:which_key_leader_map.a = { 'name' : '+actions' }
" let g:which_key_leader_map.a.c = [':ColorizerToggle'        , 'colorizer']
" let g:which_key_leader_map.a.e = [':CocCommand explorer'    , 'explorer']
let g:which_key_leader_map.a.n = [':set nonumber!'          , 'line-numbers']
let g:which_key_leader_map.a.r = [':set norelativenumber!'  , 'relative line nums']
" let g:which_key_leader_map.a.s = [':let @/ = ""'            , 'remove search highlight']
let g:which_key_leader_map.a.t = [':FloatermToggle'         , 'terminal']
let g:which_key_leader_map.a.v = [':Codi'                   , 'virtual repl on']
let g:which_key_leader_map.a.V = [':Codi!'                  , 'virtual repl off']

" b is for buffer
" let g:which_key_leader_map.b = {
"       \ 'name' : '+buffer' ,
"       \ '1' : ['b1'        , 'buffer 1']        ,
"       \ '2' : ['b2'        , 'buffer 2']        ,
"       \ 'd' : ['bd'        , 'delete-buffer']   ,
"       \ 'f' : ['bfirst'    , 'first-buffer']    ,
"       \ 'h' : ['Startify'  , 'home-buffer']     ,
"       \ 'l' : ['blast'     , 'last-buffer']     ,
"       \ 'n' : ['bnext'     , 'next-buffer']     ,
"       \ 'p' : ['bprevious' , 'previous-buffer'] ,
"       \ '?' : ['Buffers'   , 'fzf-buffer']      ,
"       \ }

" s is for search
let g:which_key_leader_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'              , 'history'],
      \ ';' : [':Commands'              , 'commands'],
      \ 'a' : [':Ag'                    , 'text Ag'],
      \ 'b' : [':BLines'                , 'current buffer'],
      \ 'B' : [':Buffers'               , 'open buffers'],
      \ 'c' : [':Commits'               , 'commits'],
      \ 'C' : [':BCommits'              , 'buffer commits'],
      \ 'f' : [':Files'                 , 'files'],
      \ 'g' : [':GFiles'                , 'git files'],
      \ 'G' : [':GFiles?'               , 'modified git files'],
      \ 'h' : [':History'               , 'file history'],
      \ 'H' : [':History:'              , 'command history'],
      \ 'l' : [':Lines'                 , 'lines'] ,
      \ 'm' : [':Marks'                 , 'marks'] ,
      \ 'M' : [':Maps'                  , 'normal maps'] ,
      \ 'p' : [':Helptags'              , 'help tags'] ,
      \ 'P' : [':Tags'                  , 'project tags'],
      \ 's' : [':CocList snippets'      , 'snippets'],
      \ 'S' : [':Colors'                , 'color schemes'],
      \ 't' : [':Rg'                    , 'text Rg'],
      \ 'T' : [':BTags'                 , 'buffer tags'],
      \ 'w' : [':Windows'               , 'search windows'],
      \ 'y' : [':Filetypes'             , 'file types'],
      \ 'z' : [':FZF'                   , 'FZF'],
      \ }
      " \ 's' : [':Snippets'     , 'snippets'],

" g is for git
let g:which_key_leader_map.g = { 'name' : '+git' }
let g:which_key_leader_map.g.a = [':Git add .'                        , 'add all']
let g:which_key_leader_map.g.A = [':Git add %'                        , 'add current']
let g:which_key_leader_map.g.b = [':Git blame'                        , 'blame']
let g:which_key_leader_map.g.B = [':GBrowse'                          , 'browse']
let g:which_key_leader_map.g.c = [':Git commit'                       , 'commit']
let g:which_key_leader_map.g.d = [':Git diff'                         , 'diff']
let g:which_key_leader_map.g.D = [':Gdiffsplit'                       , 'diff split']
let g:which_key_leader_map.g.g = [':GGrep'                            , 'git grep']
let g:which_key_leader_map.g.G = [':Gstatus'                          , 'status']
let g:which_key_leader_map.g.h = [':GitGutterLineHighlightsToggle'    , 'highlight hunks']
let g:which_key_leader_map.g.H = ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk']
let g:which_key_leader_map.g.j = ['<Plug>(GitGutterNextHunk)'         , 'next hunk']
let g:which_key_leader_map.g.k = ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk']
let g:which_key_leader_map.g.l = [':Git log'                          , 'log']
let g:which_key_leader_map.g.p = [':Git push'                         , 'push']
let g:which_key_leader_map.g.P = [':Git pull'                         , 'pull']
let g:which_key_leader_map.g.r = [':GRemove'                          , 'remove']
let g:which_key_leader_map.g.s = ['<Plug>(GitGutterStageHunk)'        , 'stage hunk']
let g:which_key_leader_map.g.S = [':!git status'                       , 'status']
let g:which_key_leader_map.g.t = [':GitGutterSignsToggle'             , 'toggle signs']
let g:which_key_leader_map.g.u = ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk']
let g:which_key_leader_map.g.v = [':GV'                               , 'view commits']
let g:which_key_leader_map.g.V = [':GV!'                              , 'view buffer commits']

" l is for language server protocol
let g:which_key_leader_map.l = { 'name' : '+lsp' }
let g:which_key_leader_map.l['.'] = [':CocConfig'                          , 'config']
let g:which_key_leader_map.l[';'] = ['<Plug>(coc-refactor)'                , 'refactor']
let g:which_key_leader_map.l.a = ['<Plug>(coc-codeaction)'              , 'line action']
let g:which_key_leader_map.l.A = ['<Plug>(coc-codeaction-selected)'     , 'selected action']
let g:which_key_leader_map.l.b = [':CocNext'                            , 'next action']
let g:which_key_leader_map.l.B = [':CocPrev'                            , 'prev action']
let g:which_key_leader_map.l.c = [':CocList commands'                   , 'commands']
let g:which_key_leader_map.l.d = ['<Plug>(coc-definition)'              , 'definition']
let g:which_key_leader_map.l.D = ['<Plug>(coc-declaration)'             , 'declaration']
let g:which_key_leader_map.l.e = [':CocList extensions'                 , 'extensions']
let g:which_key_leader_map.l.f = ['<Plug>(coc-format-selected)'         , 'format selected']
let g:which_key_leader_map.l.F = ['<Plug>(coc-format)'                  , 'format']
let g:which_key_leader_map.l.h = ['<Plug>(coc-float-hide)'              , 'hide']
let g:which_key_leader_map.l.i = ['<Plug>(coc-implementation)'          , 'implementation']
let g:which_key_leader_map.l.I = [':CocList diagnostics'                , 'diagnostics']
let g:which_key_leader_map.l.j = ['<Plug>(coc-float-jump)'              , 'float jump']
let g:which_key_leader_map.l.l = ['<Plug>(coc-codelens-action)'         , 'code lens']
let g:which_key_leader_map.l.n = ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic']
let g:which_key_leader_map.l.N = ['<Plug>(coc-diagnostic-next-error)'   , 'next error']
let g:which_key_leader_map.l.o = ['<Plug>(coc-openlink)'                , 'open link']
let g:which_key_leader_map.l.O = [':CocList outline'                    , 'outline']
let g:which_key_leader_map.l.p = ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic']
let g:which_key_leader_map.l.P = ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error']
let g:which_key_leader_map.l.q = ['<Plug>(coc-fix-current)'             , 'quickfix']
let g:which_key_leader_map.l.r = ['<Plug>(coc-rename)'                  , 'rename']
let g:which_key_leader_map.l.R = ['<Plug>(coc-references)'              , 'references']
let g:which_key_leader_map.l.s = [':CocList -I symbols'                 , 'references']
let g:which_key_leader_map.l.S = [':CocList snippets'                   , 'snippets']
let g:which_key_leader_map.l.t = ['<Plug>(coc-type-definition)'         , 'type definition']
let g:which_key_leader_map.l.u = [':CocListResume'                      , 'resume list']
let g:which_key_leader_map.l.U = [':CocUpdate'                          , 'update CoC']
let g:which_key_leader_map.l.v = [':Vista!!'                            , 'tag viewer']
let g:which_key_leader_map.l.z = [':CocDisable'                         , 'disable CoC']
let g:which_key_leader_map.l.Z = [':CocEnable'                          , 'enable CoC']

" t is for terminal
let g:which_key_leader_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

" w is for wiki
let g:which_key_leader_map.w = {
      \ 'name' : '+wiki' ,
      \ 'w' : ['<Plug>VimwikiIndex'                              , 'ncdu'],
      \ 'n' : ['<plug>(wiki-open)'                              , 'ncdu'],
      \ 'j' : ['<plug>(wiki-journal)'                              , 'ncdu'],
      \ 'R' : ['<plug>(wiki-reload)'                              , 'ncdu'],
      \ 'c' : ['<plug>(wiki-code-run)'                              , 'ncdu'],
      \ 'b' : ['<plug>(wiki-graph-find-backlinks)'                              , 'ncdu'],
      \ 'g' : ['<plug>(wiki-graph-in)'                              , 'ncdu'],
      \ 'G' : ['<plug>(wiki-graph-out)'                              , 'ncdu'],
      \ 'l' : ['<plug>(wiki-link-toggle)'                              , 'ncdu'],
      \ 'd' : ['<plug>(wiki-page-delete)'                              , 'ncdu'],
      \ 'r' : ['<plug>(wiki-page-rename)'                              , 'ncdu'],
      \ 't' : ['<plug>(wiki-page-toc)'                              , 'ncdu'],
      \ 'T' : ['<plug>(wiki-page-toc-local)'                              , 'ncdu'],
      \ 'e' : ['<plug>(wiki-export)'                              , 'ncdu'],
      \ 'u' : ['<plug>(wiki-list-uniq)'                              , 'ncdu'],
      \ 'U' : ['<plug>(wiki-list-uniq-local)'                              , 'ncdu'],
      \ }

" Global
" <Plug>VimwikiIndex
" <Plug>VimwikiTabIndex
" <Plug>VimwikiUISelect
" <Plug>VimwikiDiaryIndex
" <Plug>VimwikiMakeDiaryNote
" <Plug>VimwikiTabMakeDiaryNote
" <Plug>VimwikiMakeYesterdayDiaryNote
" <Plug>VimwikiMakeTomorrowDiaryNote

" Local
" <Plug>Vimwiki2HTML
" <Plug>Vimwiki2HTMLBrowse
" <Plug>VimwikiDiaryGenerateLinks
" <Plug>VimwikiFollowLink
" <Plug>VimwikiSplitLink
" <Plug>VimwikiVSplitLink
" <Plug>VimwikiTabnewLink
" <Plug>VimwikiGoBackLink
" <Plug>VimwikiNextLink
" <Plug>VimwikiPrevLink
" <Plug>VimwikiGoto
" <Plug>VimwikiDeleteLink
" <Plug>VimwikiRenameLink
" <Plug>VimwikiAddHeaderLevel

" Register which key map
call which_key#register('<Space>', "g:which_key_leader_map")

" Create map to add keys to
let g:which_key_g_map =  {}

" Single mappings
let g:which_key_g_map['#'] = 'search backwards'
let g:which_key_g_map['*'] = 'search forward'
let g:which_key_g_map['%'] = 'matchit ([{}])'
let g:which_key_g_map.r = 'show usages'
let g:which_key_g_map.d = 'goto definition'
let g:which_key_g_map.f = 'goto file'
let g:which_key_g_map.y = 'goto implementation'
let g:which_key_g_map.y = 'goto type definition'
" let g:which_key_g_map['.'] = [ ':e $MYVIMRC'                , 'open init' ]
" let g:which_key_g_map[';'] = [ ':Commands'                  , 'commands' ]
" let g:which_key_g_map['='] = [ '<C-W>='                     , 'balance windows' ]
" let g:which_key_g_map[','] = [ 'Startify'                   , 'start screen' ]
" let g:which_key_g_map['d'] = [ ':bd'                        , 'delete buffer']
" let g:which_key_g_map['n'] = [ ':NERDTreeFind'              , 'explorer' ]
" let g:which_key_g_map['m'] = [ ':NERDTreeToggle'            , 'explorer' ]
" let g:which_key_g_map['f'] = [ ':Files'                     , 'search files' ]
" let g:which_key_g_map['h'] = [ '<C-W>s'                     , 'split below']
" let g:which_key_g_map['q'] = [ 'q'                          , 'quit' ]
" let g:which_key_g_map['r'] = [ ':RnvimrToggle'              , 'ranger' ]
" let g:which_key_g_map['S'] = [ ':SSave'                     , 'save session' ]
" let g:which_key_g_map['T'] = [ ':Rg'                        , 'search text' ]
" let g:which_key_g_map['h'] = [ '<C-W>v'                     , 'split below']
" let g:which_key_g_map['v'] = [ '<C-W>v'                     , 'split right']
" let g:which_key_g_map['W'] = [ 'w'                          , 'write' ]
" let g:which_key_g_map['z'] = [ 'Goyo'                       , 'zen' ]

call which_key#register('g', "g:which_key_g_map")
