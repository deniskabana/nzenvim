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
set hidden              " Don't close buffers, hide them
set nobackup            " Don't create backups
set noswapfile          " No .swp files

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
" Toggle paste mode to stop indentation
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
set listchars=tab:»\ ,trail:~,precedes:<
set list                " Show problematic characters.

" Don't require .jsx extension to use jsx syntax
let g:jsx_ext_required = 0

" Use json type with dot files
au BufRead,BufNewFile *.babelrc setfiletype json
au BufRead,BufNewFile *.eslintrc setfiletype json
au BufRead,BufNewFile *.gitignore setfiletype json

" Highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set pastetoggle=<F2>

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

" Exit vim if NERDTree is it's only open window
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
" Open NERDTree on right to retain document flow
let g:NERDTreeWinPos = "right"
" Make NERDTree wider
let g:NERDTreeWinSize = 40

" Use ; for commands (doesn't need shift pressed)
" Addictive shortcut!
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
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'godlygeek/csapprox'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'matze/vim-move'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'suan/vim-instant-markdown'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'wavded/vim-stylus'
Plug 'tpope/vim-surround'
Plug 'ap/vim-buftabline'
Plug 'alvan/vim-closetag'

call plug#end()

" Settings for .jsx highlighting in .js files
let g:jsx_ext_required = 0

" Syntax highlighting for flowtyped javascript
let g:javascript_plugin_flow = 1

" Filetypes for vim-closetag (html tag enclosing)
let g:closetag_filenames = "*.html,*.js,*.md"

" Minimal config for Deoplete (I copied this from somewhere)
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

let g:airline#extensions#branch#format = 2
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1

" Set modified file indicator in bufferline
let g:bufferline_modified = '*'
let g:bufferline_echo = 0

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

" Remap jj to <Esc> in insert mode
inoremap jj <Esc>
nnoremap KK o<Esc>
nnoremap KL O<Esc>

" Remap nerdtree toggle to ,kb (based on sublime's CMD+kb)
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
  \ 'dir':  '\v[\/](doc|tmp|node_modules|bower_components|.git|.happypack)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
" Clear CtrlP cache for the current project on vim start
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" Filter out swap and mac index files from NERDTree
let NERDTreeIgnore = ['\.swp$','\~', '.DS_Store'] " Delete unnecessary files
let NERDTreeShowHidden = 1

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Different cursor shape in insert mode |

" Enable indent lines by default
let g:indent_guides_enable_on_vim_startup=1 " Enable indent guides
let g:indent_guides_auto_colors=0 " Preferably set the colors manually

" DEFAULT THEME SETTINGS
" Color scheme settings
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " Enable 24-bit colors in iTerm2 v2.9+ -> disable for 256 schemes
colorscheme PaperColor " Other schemes I like to use: apprentice, TomorrowNightEighties
set background=dark
let g:airline_theme='base16_eighties' " bubble is good too
if (has("termguicolors"))
  set termguicolors
endif

let g:airline_powerline_fonts=1 " Use patched font symbols in airline, I recommend Sauce Code Pro

" Disable automatic comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set custom colors for indent guides
hi IndentGuidesEven guibg=none
hi IndentGuidesOdd guibg=#343434

" Set transparent vim background to display your terminal emulator background
" Comment this line for default theme background
hi! Normal ctermbg=NONE guibg=NONE

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

" Map <f10> to open vim config
nnoremap <f10> :e ~/.config/nvim/init.vim<return>
" Map <f4> to git status
nnoremap <f4> :Gstatus<return>
" Map <f6> to git browse (address copy)
nnoremap <f6> :Gbrowse!<return>
" Map <f7> to git blame
nnoremap <f7> :Gblame<return>

" Vim JS linting (does throw an error when it doesn't exist, but I don't care)
let &makeprg='node_modules/.bin/eslint -f visualstudio %'
set errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
" Lint upon hitting <f8>
nnoremap <f8> :make <bar> copen<return>
" Uncomment the following line to run when saving a .js file
"autocmd BufWritePost *.js :make

" Find currently opened buffer in NERDTree
nnoremap <f9> :NERDTreeFind<return>

" Update path to enable <gf> on commonjs imports
" eg. 'files/tex|t' => press <gf> to open file 'files/text.*'
set path+=*

" Do not run instant-markdown mode by default (opens browser)
" Use :InstantMarkdownPreview instead
let g:instant_markdown_autostart = 0

" autoreload vim when $vimrc is updated
augroup vimrc     " Source vim configuration upon save
  autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END

" Disable relative line numbering on inactive panes
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set relativenumber
    autocmd WinLeave * set norelativenumber
augroup END

" Highlight the current cursor line
hi CursorLine guibg=#31291c
" Disable for inactive panes
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
