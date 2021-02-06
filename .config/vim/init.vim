scriptencoding utf-8

augroup vimrc
  autocmd!
augroup END

let g:python3_host_prog = '$HOME/VirtualEnvs/neovim/bin/python'

source ~/.config/vim/vim-plug/plugins.vim

source ~/.config/vim/general/fold.vim
source ~/.config/vim/general/misc.vim
source ~/.config/vim/general/settings.vim

source ~/.config/vim/keys/mappings.vim

source ~/.config/vim/plug-config/ale.vim
source ~/.config/vim/plug-config/airline.vim
source ~/.config/vim/plug-config/base16.vim
source ~/.config/vim/plug-config/commentary.vim
source ~/.config/vim/plug-config/fugitive.vim
source ~/.config/vim/plug-config/fzf.vim
source ~/.config/vim/plug-config/fzf-checkout.vim
source ~/.config/vim/plug-config/ledger.vim
source ~/.config/vim/plug-config/nerdtree.vim
source ~/.config/vim/plug-config/signify.vim
source ~/.config/vim/plug-config/snippets.vim
source ~/.config/vim/plug-config/vimwiki.git
source ~/.config/vim/plug-config/whichkey.vim
source ~/.config/vim/plug-config/coc.vim
source ~/.config/vim/plug-config/vim-rescript.vim
