let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips/', 'UltiSnips']

" looks upward for tags
set tags=./tags,tags;

" workaround for nvim git gutter onload glitch (w/o this must press cntl-c
" after starting nvim to load screen
let g:gitgutter_enabled = 0
au VimEnter * :GitGutterEnable

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" for ctags
Plug 'majutsushi/tagbar'

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" surround

Plug 'tpope/vim-surround'

" tmux persistance of vim sessions
Plug 'tpope/vim-obsession'
Plug 'craigemery/vim-autotag'


" vim wiki : D
Plug 'vimwiki/vimwiki'

" gitrelated


Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Lisp?
Plug 'jpalardy/vim-slime'
"interferes with vimwiki
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'

" comments and repeat commands
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'


" Initialize plugin system
call plug#end()

source ~/.config/nvim/custom_plugins/vimapm.vim

" fix for making the tab not make a table in vim wiki
" this is so that it can still work with ultisnips
"autocmd FileType mdvimwiki UltiSnipsAddFiletypes vimwiki
let g:vimwiki_table_mappings = 0
set nocompatible
filetype plugin on
syntax on
nmap <silent> <Plug>VimwikiGoBackLink
let g:vimwiki_global_ext=0
let g:rainbow_active = 1
autocmd FileType vimwiki :RainbowToggle

set termguicolors
colorscheme gruvbox
let g:go_gopls_enabled = 1

autocmd	BufNewFile * silent! 0r $HOME/.vim/templates/%:e.skeleton
autocmd BufNewFile,BufRead *.md set syntax=markdown

" fugitive shortcuts
"
" before doing this making the leader key the comma key, just cuz
let mapleader=","
"
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" coc? settings
"
" " -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:go_def_mapping_enabled = 0

" vim easy align shortcuts (comment out to go back to telling hex for
" underneath)
" " Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" cntl p and fzf binding
nnoremap <C-p> :<C-u>FZF<CR> 

map <C-n> :NERDTreeToggle<CR>
 
" set relative number with current line number on the center
set number relativenumber

" set key for tagbar toggling
nmap <C-k> :TagbarToggle<CR>

