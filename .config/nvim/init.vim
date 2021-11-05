set number
" source ~/AppData/Local/nvim/vim-plug/plugins.vim

syntax on

set tabstop=4
set smartindent

set number
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set shiftwidth=4

set nowrap
set smartcase

set noswapfile
set nobackup

set nohlsearch
set hidden
set noerrorbells
set ignorecase


set termguicolors
set scrolloff=8

set signcolumn=yes
set colorcolumn=80

" leader for the keybinds
let mapleader = " "


call plug#begin()

" coc plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autosave plugin
Plug 'Pocco81/AutoSave.nvim'

" nerd tree: a file explorer for neovim
Plug 'preservim/nerdtree'

" database
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Markdown(.md) files preview in browser
Plug 'suan/vim-instant-markdown', {'rtp':'after'}

"emojis
Plug 'junegunn/vim-emoji'

" hyperfocus on a range
Plug 'junegunn/limelight.vim'

Plug 'frazrepo/vim-rainbow'

" File management
Plug 'vifm/vifm.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" change surrounding marks
Plug 'tpope/vim-surround'

" icons for neovim
Plug 'kyazdani42/nvim-web-devicons'

" distraction free writing
Plug 'junegunn/goyo.vim'

" color preview for css
Plug 'ap/vim-css-color'

" Top tab bar
Plug 'romgrk/barbar.nvim'

" Wakatime extension
Plug 'wakatime/vim-wakatime'

"prettier 
Plug 'sbdchd/neoformat'

" Bottom bar for neovim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" splits neovim into neovim and a terminal(might not work on windows)
Plug 'vimlab/split-term.vim'

" FZF
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'


" One dark pro theme
Plug 'joshdick/onedark.vim'

" nord color theme
Plug 'arcticicestudio/nord-vim'

" Plugin for javascript
Plug 'pangloss/vim-javascript'

" Color theme: currently the main
Plug 'folke/tokyonight.nvim', {'branch':'main'}

" Svelte syntax
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Emmet for vim, support html and xml
Plug 'mattn/emmet-vim'

Plug 'preservim/nerdcommenter'
call plug#end()

let g:neovide_cursor_vfx_mode = "wireframe"

"displays all matches when tab complete
set wildmenu

set termguicolors
set mouse+=a

" setting airline theme
let g:airline_theme='hybrid'

syntax enable
filetype plugin indent on

colorscheme tokyonight
set bg=dark
" Transparent 
"hi Normal guibg=NONE ctermbg=NONE

" Quick Escape
inoremap jk <Esc>
inoremap kj <Esc>

" run prettier on save
autocmd BufWritePre,TextChanged,InsertLeave * Neoformat
autocmd FileType * setlocal formatprg=prettier\ --single-quote\ --trailing-comma\
" use formatprg when available
let g:neoformat_try_formatprg=1

" Fzf bindings
nnoremap <C-p> :Files<CR>
nnoremap <C-I> :Rg<CR>


let $FZF_DEFAULT_COMMAND="fd --type f"

" C-Space will start autocomplete
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Splits
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <leader>w :set wrap
set clipboard=unnamedplus

" coc.nvim 
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" COC CONFIG

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

map <C-w> :tabclose<CR>

" nerdtree config
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

let g:neovide_transparency=0.9
