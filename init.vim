" Set language to english
set langmenu=en_US
let $LANG = 'en_US'

" Change leader key from \ to ,
let mapleader=","

set showcmd                " Show (partial) command in status line
set showmatch              " Show matching brackets
set noshowmode             " Don't show current mode
set number                 " Show the line numbers on the left side
set relativenumber         " Show relative line numbering
set hidden                 " Ability to close buffer without saving it

set textwidth=0            " Don't wrap lines when reformatting
set expandtab              " Insert spaces when TAB is pressed
set tabstop=2              " Render TABs using this many spaces
set shiftwidth=2           " Indentation amount for < and > commands
set history=1000           " Remember 1000 steps back
set undolevels=1000        " Undo a thousand times
set title                  " Change terminal title

set noerrorbells           " No beeps when reaching end of file
set nomodeline             " Disable modeline - security vulnerability
set linespace=0            " Set vertical space between lines to a minimum
set nojoinspaces           " Prevents inserting two spaces after punctuation on a join
set backupdir=~/.vim/tmp,. " Save backups (swap/ext files) to a dedicated directory (create beforehand)
set directory=~/.vim/tmp,. " Save backups (swap/ext files) to a dedicated directory (create beforehand)
set hlsearch               " Highlight search results.
set noshowmode
set ignorecase             " Make searching case insensitive
set smartcase              " ... unless the query has capital letters.
set incsearch              " Incremental search.
set gdefault               " Use 'g' flag by default with :s/foo/bar/.
set magic                  " Use 'magic' patterns (extended regular expressions).

" More natural splits
set splitbelow             " Horizontal split below current
set splitright             " Vertical split to right of current
set pastetoggle=<F2>       " Toggle paste mode to stop indentation

" Absolute line numbers in inactive splits, hybrid in splits
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

filetype plugin indent on  " Handle correct filetype selection, specific plugins and indentation detection

" More user-friendly scrolling
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Tell Vim which characters to show for expanded TABs, trailing whitespace, and end-of-lines. VERY useful!
set listchars=tab:»\ ,trail:~,precedes:<
" Show problematic characters.
set list
" Highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\|\t/
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Use json type with common dot files
au BufRead,BufNewFile *.babelrc setfiletype json
au BufRead,BufNewFile *.eslintrc setfiletype json
au BufRead,BufNewFile *.gitignore setfiletype json

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" NERDTree settings
" Exit vim if NERDTree is it's only open window
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
"function! s:CloseIfOnlyNerdTreeLeft()
  "if exists("t:NERDTreeBufName")
    "if bufwinnr(t:NERDTreeBufName) != -1
      "if winnr("$") == 1
        "q
      "endif
    "endif
  "endif
"endfunction
"let NERDTreeShowLineNumbers=1 " Show line numbers in NERDTree

" Highlight filenames in NERDTree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeWinPos = "right" " Open NERDTree on the right side

" Use ; for commands (doesn't need shift pressed)
nnoremap ; :

" Always update plugins when neovim starts
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Plugins (with vim-plug)
call plug#begin('~/.vim/plugged')

" Load all plugins
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'ap/vim-css-color/'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-signify'
Plug 'mattn/emmet-vim'
Plug 'Soares/butane.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jacoborus/tender.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mileszs/ack.vim'
Plug 'wavded/vim-stylus'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sleuth'
Plug 'pangloss/vim-javascript'
Plug 'djoshea/vim-autoread'
Plug 'Valloric/MatchTagAlways'
Plug 'carlitux/deoplete-ternjs'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'Yggdroot/indentLine'

call plug#end()

" Settings for .jsx highlighting in .js files
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1

" Filetypes for vim-closetag (html tag enclosing)
let g:closetag_filenames = "*.html,*.js,*.md,*.jsx,*.ts,*.tsx"

" Minimal config for Deoplete (I copied this from somewhere)
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['javacomplete2']
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
set isfname-==

" Butane
noremap <leader>bd :Bclose<CR>      " Close the buffer.
noremap <Tab> :bn<CR>               " Next buffer.
noremap <S-Tab> :bp<CR>             " Previous buffer.
noremap <leader>bn :bn<CR>          " Next buffer (legacy mapping).
noremap <leader>bp :bp<CR>          " Previous buffer (legacy mapping).
noremap <leader>bt :b#<CR>          " Toggle to most recently used buffer.
noremap <leader>bx :Bclose!<CR>     " Close the buffer & discard changes.

inoremap jj <Esc>                   " Remap jj to <Esc> in insert mode
nnoremap KK o<Esc>                  " Insert empty line below cursor
nnoremap KL O<Esc>                  " Insert empty line above cursor

" Remap nerdtree toggle to ,kb (based on sublime's CMD+kb)
noremap <leader>kb :NERDTreeToggle<CR>

let g:user_emmet_mode='in' " Enable emmet in insert and normal modes

" Filter out swap and mac index files from NERDTree
let NERDTreeIgnore = ['\.swp$','\~', '.DS_Store', '.git'] " Don't show unnecessary files
let NERDTreeShowHidden = 1

" Theme
syntax enable
colorscheme tender

" Disable automatic comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Use system clipboard by default (the best thing by far in this vimrc)
function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction
" This also allows the ease of use of CMD+C / V

" Remap default copy/paste keys to clipboard functions
vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
onoremap <silent> y y:call ClipboardYank()<cr>
onoremap <silent> d d:call ClipboardYank()<cr>

" Update path to enable <gf> on file/module imports
" eg. 'files/tex|t' => press <gf> to open file 'files/text.*'
set path+=*

" Highlight the current cursor line
set cursorline

" Use ack.vim for search with ripgrep
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
  let $FZF_DEFAULT_COMMAND = 'rg --files'
endif

" Lightline theme
let g:lightline = {
  \ 'colorscheme': 'tender',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }

" When FZF launches hide status line
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0
  \| autocmd BufLeave <buffer> set laststatus=2
" Open FZF by pressing <C-p>
nnoremap <C-p> :FZF<return>

" MatchTagAlways filetypes
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascript' : 1,
    \ 'javascript.jsx' : 1,
    \ 'typescript' : 1,
    \ 'typescript.tsx' : 1,
    \}

" Identify the syntax highlighting group used at the cursor
map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Search inside a project (check Ack docs for precise info)
nnoremap <leader>f :Ack!
" Toggle highlighting CSS colors
nnoremap <leader>cs :call css_color#toggle()<cr>

" Conceal javascript stuff
set conceallevel=1
