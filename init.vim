" Set language to english
set langmenu=en_US
let $LANG = 'en_US'

" Change the mapleader from \ to ,
let mapleader=","

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set relativenumber      " Show relative line numbering

set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set history=1000        " Remember 1000 steps back
set undolevels=1000     " Undo a thousand times
set title               " Change terminal title

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
set pastetoggle=<F2>

" Ability to close buffer without saving it
set hidden

filetype plugin indent on

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

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Don't require .jsx extension to use jsx syntax
let g:jsx_ext_required = 0

" Set json type for dot files
au BufRead,BufNewFile *.babelrc setfiletype json
au BufRead,BufNewFile *.eslintrc setfiletype json
au BufRead,BufNewFile *.gitignore setfiletype json

" Highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Exit NERDTree if it's the only open window
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Show line numbers in NERDTree for faster navigation
let NERDTreeShowLineNumbers=1

" Use ; for commands (doesn't need shift pressed)
nnoremap ; :

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Plugins (with vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-css-color/'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'bling/vim-bufferline'
Plug 'mhinz/vim-signify'
Plug 'mattn/emmet-vim'
Plug 'Soares/butane.vim'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'godlygeek/csapprox'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Settings for .jsx highlighting
let g:jsx_ext_required = 0

" Settings for UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Minimal config for Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#omni#input_patterns.java = [
            \'[^. \t0-9]\.\w*',
            \'[^. \t0-9]\->\w*',
            \'[^. \t0-9]\::\w*',
            \]
let g:deoplete#omni#input_patterns.jsp = ['[^. \t0-9]\.\w*']
let g:deoplete#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['javacomplete2']
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
set isfname-==

let g:indent_guides_enable_on_vim_startup = 0

let g:airline#extensions#branch#format = 2
let g:airline#extensions#hunks#enabled = 1
" Single-letter mode names for AirLine
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

" Butane
noremap <leader>bd :Bclose<CR>      " Close the buffer.
noremap <leader>bl :ls<CR>          " List buffers.
noremap <leader>bn :bn<CR>          " Next buffer.
noremap <leader>bp :bp<CR>          " Previous buffer.
noremap <leader>bt :b#<CR>          " Toggle to most recently used buffer.
noremap <leader>bx :Bclose!<CR>     " Close the buffer & discard changes.

" Remap nerdtree to ,kb (based on sublime's CMD+kb)
noremap <leader>kb :NERDTreeToggle<CR>

let g:user_emmet_mode='in' " Enable emmet in insert and normal modes

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|node_modules)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Filter out swap and mac index files from NERDTree
let NERDTreeIgnore = ['\.swp$','\~', '.DS_Store']
let NERDTreeShowHidden = 1

" Color scheme settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " Enable 24-bit colors in iTerm2 v2.9+ -> disable for 256 schemes
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 "Different cursor shape in insert mode
if (has("termguicolors"))
  set termguicolors
endif

" Color scheme
syntax enable
colorscheme OceanicNext
set background=dark
let g:airline_theme='oceanicnext'

let g:airline_powerline_fonts=1 " Use patched font symbols in airline

" Disable automatic comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set AirLine theme
let g:airline_theme = "hybridline"

" Disable auto colors for indent guides and custom colors
let g:indent_guides_auto_colors=0

let g:indent_guides_enable_on_vim_startup=1
hi IndentGuidesEven guibg=none
hi IndentGuidesOdd guibg=#1b2b34

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1

" Use system clipboard by default
function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
onoremap <silent> y y:call ClipboardYank()<cr>
onoremap <silent> d d:call ClipboardYank()<cr>

" Custom colors for signify diff checker
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227

" Use Control-L to exit insert/visual/replace mode
imap <C-L> <Esc>

" Open NERDTree by default
autocmd VimEnter * NERDTree

" Map <f10> to open vim config
nnoremap <f10> :e ~/.config/nvim/init.vim<return>

" Vim linting
let &makeprg='node_modules/.bin/eslint -f compact --quiet %'
set errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
" Lint upon hitting <f8>
nnoremap <f8> :make<return>
" Find currently opened buffer in NERDTree
nnoremap <f9> :NERDTreeFind<return>
" Run automatically when saving a .js file
"autocmd BufWritePost *.js :make
