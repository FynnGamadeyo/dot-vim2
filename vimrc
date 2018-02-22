" vim

" Plugin Setting {{{
" pathogen - vim plugin manager
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
" filetype plugin on

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 


" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
" let g:instant_markdown_autostart = 0	" disable autostart
" map <leader>md :InstantMarkdownPreview<CR>

" }}}

" General Setting {{{

" Sets how many lines of history VIM has to remember
set history=500

" Show line number
set number

" Use relative number ( easy to jump, delete and copy )
set relativenumber

" using clipboard as default
set clipboard=nnamedplus

" Set to auto read when a file is changed from the outside
set autoread

" Enable mouse
set mouse=a

" set UTF-8
scriptencoding utf-8
set encoding=utf-8

" }}}

" Search setting {{{

" Ignoce case when searching
set ignorecase

" When searching tr to be smart about cases
set smartcase

" Highlight search resut
" set hlsearch

" Makes search act like search in modern browsers
set incsearch

" }}}

" General programming settings {{{

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Enable sytnax higlighting
syntax enable

" Turn backup of
set nobackup
set nowb
set noswapfile

" }}}

" Sound settings {{{

" disable error sound
set noerrorbells
set novisualbell

"}}}

" Shortcuts {{{

" set leader key 
let mapleader = ","

" create new tab
nnoremap <C-t> :tabnew<CR>

" execute ranger
map <Leader>x :call RangerExplorer()<CR>

" copy or paste from X11 clipboard
" http://vim.wikia.com/wiki/GNU/Linux_clipboard_copy/paste_with_xclip
vmap <leader>xyy :!xclip -f -sel clip<CR>
map <leader>xpp mz:-1r !xclip -o -sel clip<CR>`z

"}}}

" folding feature {{{
" enable folding; http://vim.wikia.com/wiki/Folding
set foldmethod=marker
" autocmd FileType vim,txt setlocal foldmethod=marker

" fold color
hi Folded cterm=bold ctermfg=DarkBlue ctermbg=none
hi FoldColumn cterm=bold ctermfg=DarkBlue ctermbg=none

"refocus folds; close any other fold except the one that you are on
nnoremap <space> zMzvzz

"set foldlevelstart=1

" }}}

" Additional function {{{

" Ranger File Browser in Vim
" http://www.everythingcli.org/use-ranger-as-a-file-explorer-in-vim/
function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun

" }}}

" Python env {{{
autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal tabstop=8
autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal softtabstop=4
autocmd FileType python setlocal expandtab
autocmd FileType python setlocal foldnestmax=2
autocmd FileType python setlocal foldlevelstart=1
autocmd FileType python setlocal autoindent
" }}}
