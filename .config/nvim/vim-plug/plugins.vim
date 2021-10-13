" auto install vim plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
3
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
4
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
5
  "autocmd VimEnter * PlugInstall
6
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
7
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" coc plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Svelte syntax
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" One dark pro theme
Plug 'joshdick/onedark.vim'

Plug 'arcticicestudio/nord-vim'

Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'

" Svelte syntax
Plug 'evanleck/vim-svelte', {'branch': 'main'}

Plug 'mattn/emmet-vim'
" Comment

Plug 'preservim/nerdcommenter'
call plug#end()
