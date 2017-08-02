" vim: sw=4 ts=4 et
scriptencoding utf-8
call plug#begin()
    " system
    Plug 's3rvac/AutoFenc'

    " appearance
    Plug 'andviro/NeoSolarized'
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'wincent/terminus'
    if has("nvim")
        Plug 'kassio/neoterm'
    endif

    " usability
    Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'scrooloose/nerdcommenter'
    Plug 'FelikZ/ctrlp-py-matcher'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'sjl/gundo.vim'
    Plug 'Raimondi/delimitMate'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'mtth/scratch.vim'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'fabi1cazenave/suckless.vim'
    Plug 'kshenoy/vim-signature'
    
    " snippets
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'noahfrederick/vim-skeleton'

    " VCS
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-git'
    "Plug 'phleet/vim-mercenary'

    " devel
    Plug 'fatih/vim-go'
    Plug 'metakirby5/codi.vim'
    Plug 'w0rp/ale'
    if has("nvim")
        Plug 'roxma/nvim-completion-manager'
    else
        Plug 'maralla/completor.vim'
    endif
    Plug 'andviro/flake8-vim'
    Plug 'davidhalter/jedi-vim'
    Plug 'kchmck/vim-coffee-script'
    Plug 'elzr/vim-json'
    Plug 'hynek/vim-python-pep8-indent'
    Plug 'mtscout6/vim-cjsx'
    Plug 'leafgarland/typescript-vim'
    Plug 'amiorin/vim-fenced-code-blocks'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-pandoc/vim-pandoc-after'
    Plug 'junegunn/vim-easy-align'
    Plug 'groenewege/vim-less'
    Plug 'digitaltoad/vim-jade'
    Plug 'stephpy/vim-yaml'
    Plug 'chase/vim-ansible-yaml'
    Plug 'Chiel92/vim-autoformat'
    Plug 'KabbAmine/zeavim.vim'

    " misc
    "Plug 'ryanoasis/vim-devicons'
call plug#end()

" system
"
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set clipboard^=unnamed,unnamedplus
set undofile
set autoread
set autowrite
set hidden
set backup
set viewoptions=cursor,folds,slash,unix
set title
set history=1000
set tabpagemax=50
set viminfo^=!
set sessionoptions-=options
set nolazyredraw
set backupdir-=.
set undodir-=.
set directory-=.

" files
set wildignore+=RCS,CVS,*~,*.aux,*.bak,*.dvi,*.toc
set wildignore+=*.idx,*.log,*.swp,*.tar,*.o,*.cm?,*.d
set wildignore+=*.haux,*.htoc,*.image.tex,*.pyc,*.out,*\\,v
set wildignore+=*.bbl,*.blg,*.out
set wildignore+=.git,.hg,*.svn
set wildignore+=*.sqlite

" search
set smartcase
set ignorecase
set incsearch
set nohlsearch
set infercase

"navigation
set scrolloff=3
set nostartofline
set cursorline
set colorcolumn=+1
set textwidth=79


" editing
set whichwrap=<,>,h,l
set nowrap

set listchars=tab:\|\ ,eol:·,nbsp:~
"set listchars=tab:❘\ ,eol:·,nbsp:~
"set listchars=tab:⋮\ ,eol:·,nbsp:~
set list
set nonumber
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set virtualedit=block
set autoindent
set smartindent
set backspace=indent,eol,start
set complete-=i
"set nrformats-=octal
set formatoptions=jcroql
let g:mapleader = ';'

" windows
set splitbelow
set noequalalways
set helpheight=10
set nowildmenu
set completeopt-=preview
set winwidth=100
set winheight=5
set winminheight=5
set winheight=999

" i18n
set fileencodings=utf-8,cp1251,koi8-r
set spelllang=ru,en
set keymap=russian-yawerty
set iminsert=0
set imsearch=-1

" appearance
augroup vimappearance
    au VimEnter * set laststatus=0
augroup END
set ruler
set showcmd
set wildmenu
set background=dark
set display+=lastline
let g:neosolarized_contrast='normal'
let g:neosolarized_visibility='low'
colorscheme NeoSolarized
hi ValidatorErrorSign ctermbg=0 cterm=bold ctermfg=88 term=standout
hi ValidatorWarningSign ctermbg=0 cterm=bold ctermfg=3 term=standout
let g:validator_permament_sign = 1
"
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &runtimepath) ==# ''
  runtime! macros/matchit.vim
endif

" GUI font
if has('gui')
    set guifont=RobotoMono\ Nerd\ Font\ 15
endif

" Ctrl-space tweak
if !has('gui_running')
    map <C-@> <C-Space>
    imap <C-@> <C-Space>
    cmap <C-@> <C-Space>
endif

" IM switch
imap <C-\> <C-^>
imap <C-_> <C-^>
imap <C-Space> <C-^>
cmap <C-\> <C-^>
cmap <C-_> <C-^>
cmap <C-Space> <C-^>
nmap <silent> <C-\> :let &l:iminsert = !&l:iminsert<CR>
nmap <silent> <C-/> :let &l:iminsert = !&l:iminsert<CR>
nmap <silent> <C-_> :let &l:iminsert = !&l:iminsert<CR>
nmap <silent> <C-Space> :let &l:iminsert = !&l:iminsert<CR>

" general key bindings
nnoremap <silent> <C-j> :tabprev<CR>
nnoremap <silent> <C-k> :tabnext<CR>
nnoremap <silent> <M-l> :nohlsearch<CR><C-L>
nnoremap <silent> <Tab> :b#<CR>
map <Space> <C-D>
nnoremap <BS> <C-O>
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprev<CR>
nnoremap <silent> <C-W>q :bprev <BAR> bdelete #<CR>
nnoremap <silent> <CR> <C-]>
nnoremap H <C-o>
nnoremap L <C-i>

" emacs-like insert mode
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
inoremap <C-B>      <Left>
cnoremap <C-D>      <Del>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
inoremap <C-F>      <Right>
cnoremap <C-N>      <Down>
cnoremap <C-P>      <Up>
cnoremap <Esc><C-B> <S-Left>
cnoremap <Esc><C-F> <S-Right>

" Neovim terminal
if has("nvim")
    tnoremap <Esc> <C-\><C-n>
endif

" utility functions
fun! init#restore_cursor() 
    if line('''"') <= line('$')
        silent! normal! g`"
        return 1
    endif
endfunction 

" from unite.vim plugin
fun! init#projectDir() abort 
    let l:parent = expand('%:p:h')
    while 1
        for l:marker in ['.git', '.hg', '.svn']
            let l:path = l:parent . '/' . l:marker
            if isdirectory(l:path)
              return fnamemodify(l:parent, ':~:.')
            endif
        endfor
        let l:next = fnamemodify(l:parent, ':h')
        if l:next == l:parent
          return ''
        endif
        let l:parent = l:next
    endwhile
endfunction

" autocommands
augroup vimrc
au!
    " usability
    au QuickfixCmdPost make,grep :cwin 5
    au BufWinEnter * call init#restore_cursor()
    au FocusLost * if &modifiable && &modified | write | endif
    au CursorMovedI * if pumvisible() == 0|pclose|endif 
    au InsertLeave * if pumvisible() == 0|pclose|endif
    au BufEnter * silent! lcd <afile>:p:h

    " filetype-specific
    au BufNewFile,BufRead *.json setf javascript
    au BufNewFile,BufRead *.j2 setlocal ft=jinja
    au BufNewFile,BufRead *.tag setlocal ft=html
    au BufRead,BufNewFile *.txt setlocal ft=asciidoc
    au BufRead *.hva setlocal ft=tex
    au BufWrite *.html :Autoformat
    au BufAdd,BufNewFile,BufRead * let b:base_project_dir = init#projectDir()
augroup END

" coffeescript
let g:coffee_lint_options = '-f ' . $HOME . '/.vim/coffeelint.json'
augroup coffeeScript
au!
au BufWritePost *.coffee CoffeeLint! | 5cwin
augroup end

" nerdcommenter
let g:NERDCommentEmptyLines = 1
vmap <silent> K <plug>NERDCommenterInvert
let g:NERDCustomDelimiters = {
    \ 'spice': { 'left': '* ' },
    \ 'fsharp': { 'left': '// ' },
    \ 'go': { 'left': '// ' },
    \ 'python': { 'left': '# ' },
    \ 'snippets': { 'left': '# ' },
    \ 'jinja': { 'left': '{# ', 'right': ' #}' }
\ }

" nerdtree
let g:NERDTreeQuitOnOpen = 1
nnoremap <silent> <Leader><Tab> :<C-u>NERDTreeFind<CR>
fun! init#leaveNerdTree()
    close
endfun
augroup vimrc
    au VimEnter * call NERDTreeAddKeyMap({
           \ 'key': '<Tab>',
           \ 'callback': 'init#leaveNerdTree',
           \ 'quickhelpText': 'leave window',
           \})
augroup END

" airline
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
let g:airline_detect_iminsert=1

" vim-skeleton
let g:skeleton_replacements = {}
let g:skeleton_template_dir = expand('<sfile>:p:h').'/templates'

function! g:skeleton_replacements.CLASS()
    let l:filen = tolower(expand('%:t:r'))
    return substitute(l:filen, '\\([a-zA-Z]\\+\\)', '\\u\\1\\e', 'g')
endfunction
function! g:skeleton_replacements.NAME()
    return tolower(expand('%:t:r'))
endfunction

" jedi
let g:jedi#popup_on_dot = 1
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 0
let g:jedi#goto_assignments_command = '<CR>'
let g:jedi#goto_definitions_command = '<Leader><CR>'
let g:jedi#rename_command = '<Leader>R'
let g:jedi#usages_command = '<Leader>n'

" ultisnips / YCM
let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
let g:ycm_autoclose_preview_window_after_completion = 1
inoremap <expr><c-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><c-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
let g:UltiSnipsExpandTrigger='<C-L>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
let g:UltiSnipsListSnippets='<c-h>'

" [GM]undo
let g:gundo_prefer_python3 = 1
map <Leader>u :GundoToggle<CR>


" neomake
nmap <leader>b :<C-u>silent wa<CR>:Neomake!<CR>
let g:neomake_open_list=1
let g:neomake_place_signs=1
let g:neomake_list_height=7

" fugitive
nmap <silent> <Leader>gs :Gstatus<CR>
nmap <silent> <Leader>gc :Gcommit -v<CR>
nmap <silent> <Leader>gC :Gcommit -a -v<CR>
nmap <silent> <Leader>ga :Git add %<CR>
nmap <silent> <Leader>gA :Git add -A .<CR>
nmap <silent> <Leader>gp :Git push -u origin HEAD<CR>
nmap <silent> <Leader>gu :Git pull<CR>

" neoterm
if has("nvim")
    nmap <silent> <Leader>r :TREPLSendFile<CR>
endif

" ctrlp
let g:ctrlp_key_loop = 1
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_reuse_window = 'netrw\|quickfix'
let g:ctrlp_extensions = ['session']
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](\.git|\.hg|\.svn|bower_components|node_modules|vendor)$'
\ }
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10000'
"let g:ctrlp_default_input = 0

let g:ctrlp_user_command = {
\ 'types': {
  \ 1: ['.git', 'cd %s && git ls-files -c -o --exclude-standard .'],
  \ 2: ['.hg', 'hg --cwd %s status -numac -I . $(hg root)'],
  \ },
\ 'fallback': 'find %s -type f'
\ }

" If ag is available use it as filename list generator instead of 'find'
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command['fallback'] = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore "vendor" --ignore ''node_modules'' --hidden -g ""'
endif

" PyMatcher for CtrlP
if has('python3') || has('python')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
" Set delay to prevent extra search
let g:ctrlp_lazy_update = 1

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 1

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" vim-pandoc and markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
let g:pandoc#formatting#textwidth=79
let g:pandoc#modules#disabled = ['folding']
let g:pandoc#after#modules#enabled = ['ultisnips']
let g:pandoc#syntax#codeblocks#embeds#langs=['python','cpp','html','go']
let g:pandoc#folding#fdc=0
let g:pandoc#formatting#mode='h'
let g:pandoc#folding#mode = 'stacked'

" vim-easy-align
vmap <silent> <Bar> :EasyAlign*<Bar><CR>

" Neoterm
let g:neoterm_size = 7

" vim-go
"let g:go_fmt_command = 'goimports'
let g:go_def_mapping_enabled = 0

" scratch
let g:scratch_no_mappings = 1
let g:scratch_filetype = 'pandoc'
let g:scratch_persistence_file = $HOME . '/Dropbox/notes.md'
nmap gs <plug>(scratch-insert-reuse)

" splitjoin
let g:splitjoin_split_mapping = 'gS'
let g:splitjoin_join_mapping  = 'gJ'
