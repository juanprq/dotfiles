set encoding=utf-8
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'hzchirs/vim-material'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'mattn/emmet-vim'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'elixir-editors/vim-elixir'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'evanleck/vim-svelte'
Plug 'flowtype/vim-flow'
Plug 'easymotion/vim-easymotion'
Plug 'amadeus/vim-mjml'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'NieTiger/halcyon-neovim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'phanviet/vim-monokai-pro'
Plug 'preservim/tagbar'
Plug 'mg979/vim-visual-multi'
Plug 'zivyangll/git-blame.vim'
Plug 'Pocco81/HighStr.nvim'
Plug 'jparise/vim-graphql'
Plug 'artanikin/vim-synthwave84'
Plug 'chrisbra/unicode.vim'

call plug#end()

set autoread
set splitright
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set nrformats=
set history=200
set nocompatible
set autoindent
set smartindent
" set spell
" set spelllang=en_us

set clipboard=unnamed
set showcmd
set ruler
set showmatch
set laststatus=2
set timeoutlen=1000
set ttimeoutlen=0

" Python setup
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=120 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

filetype plugin on
runtime macros/matchit.vim

set omnifunc=syntaccomplete#Complete
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

if (has('termguicolors'))
  set termguicolors
endif

" colorscheme molokai
" colorscheme sublimemonokai
colorscheme gruvbox
" colorscheme monokai_pro
" colorscheme vim-material
" colorscheme synthwave84
highlight Comment cterm=italic gui=italic

" Rebalance all of the windows in case of a split pane from tmux
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

map <Space> <leader>
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
map <Leader>gs :Gstatus<CR>
map <Leader>o o<Esc>
map <Leader>O O<Esc>

nmap <C-F>f <Plug>CtrlSFPrompt
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFPwordPath

" easy motion
nmap <leader>S <Plug>(easymotion-s2)

" this is for python only
nnoremap <buffer> <F9> : exec '!clear' :exec '!python3' shellescape(@%, 1)<cr>

" For javascript
let g:ale_linters = {
\'javascript': ['flow', 'eslint'],
\}
let g:ale_fixers = {
\'javascript': ['eslint'],
\}
let g:javascript_plugin_flow = 1
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" This is for nerdtree only
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>g :NERDTreeFind<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1

nnoremap <Left> :echo "No Left for you!"<CR>
nnoremap <Right> :echo "No Right for you!"<CR>
nnoremap <Up> :echo "No Up for you!"<CR>

nnoremap gp :silent %!prettier --stdin-filepath %<CR>

" This is for COC
" set hidden
" set nobackup
" set nowritebackup
" set cmdheight=2
" set updatetime=300
" set shortmess+=c
" set signcolumn=yes
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>ac  <Plug>(coc-codeaction)
" nmap <leader>qf  <Plug>(coc-fix-current)
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
" command! -nargs=0 Format :call CocAction('format')
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

map <Leader>t :Clap files<CR>
map <Leader>s :Clap grep2<CR>
map <Leader>l :Clap lines<CR>
map <Leader>w :Clap windows<CR>
map <Leader>c :Clap commits<CR>
map <Leader>r :Clap registers<CR>
let g:clap_theme = 'material_design_dark'

nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

set guifont=FiraCode\ Nerd\ Font:h18
