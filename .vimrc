call plug#begin()

" Tim Pope's sensible defaults
Plug 'tpope/vim-sensible' 

" Comments with 'gc' (same as my old neovim config) 
Plug 'tpope/vim-commentary'

" Plugin for asynchronous dispatching (i.e. compiling markdown to pdf with pandoc)
Plug 'tpope/vim-dispatch'

" Snippets plugin for quickly typesetting math equations
Plug 'SirVer/ultisnips'

" Markdown preview plugin, for quickly viewing markdown documents
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install() }, 'for': ['markdown', 'Rmd', 'vim-plug']}

" Gruvbox theme
Plug 'morhetz/gruvbox'

call plug#end()


""""""""""""""""""""
" GENERAL SETTINGS "
""""""""""""""""""""


" Configure spell language
set spelllang=en_ca

" Enable absolute and relative line numbers
set number
set relativenumber
set linebreak

" Highlight text after search
set hlsearch

" Always use spaces for indentation
set expandtab
set sw=4 ts=4 sts=4
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType yaml :setlocal sw=2 ts=2 sts=2
autocmd FileType markdown :setlocal sw=2 ts=2 sts=2

" Set the default clipboard to the system clipboard
set clipboard=unnamedplus

" Markdown preview settings
let g:mkdp_auto_close = 0
let g:mkdp_combine_preview = 1


""""""""""""""""""
" STYLE SETTINGS "
"""""""""""""""""" 

" Import and configure gruvbox theme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italicize_comments=0
let g:gruvbox_invert_selection=0

" Set background colour and import colour scheme
set termguicolors
set background=dark
colorscheme gruvbox

"Configure spelling errors
autocmd ColorScheme * highlight SpellBad cterm=underline ctermfg=Red guifg=Red
highlight SpellBad cterm=underline ctermfg=Red guifg=Red

" Additional syntax highlighting options for markdown files
function! SetupMarkdownSyntax()

	" Custom syntax highlighting for markdown file names (open with 'gf')
	syn match mkdFile /[a-zA-Z0-9\-\.]*\.md/
	hi mkdFile guifg=#d3869b

	" Custom syntax highlighting for URLs (open with 'gx')
	syn match mkdUrl /https:\/\/\([^ [:space:]\(\)]\)*/
	hi mkdUrl guifg=#d3869b

	" Custom syntax highlighting for dates (because I like it)
	syn match mkdDate /\d\{2}\/\d\{2}\/\d\{2}\(\s\d\{4}\)\?/
	hi mkdDate guifg=#8ec07c

	" Custom syntax highlighting for math mode
	syn include @tex syntax/tex.vim
	syn region mkdMath start="\\\@<!\$" end="\$" skip="\\\$" contains=@tex keepend
	syn region mkdMath start="\\\@<!\$\$" end="\$\$" skip="\\\$" contains=@tex keepend
	hi mkdMath guifg=#fe8019

endfunction

autocmd FileType markdown call SetupMarkdownSyntax()
autocmd FileType Rmd call SetupMarkdownSyntax()


"""""""""""""
" SHORTCUTS "
"""""""""""""

" Custom copy shortcut since terminal vim on Wayland is annoying
vnoremap <leader>y :silent! w !wl-copy<CR>

" UltiSnips settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Shortcuts for writing and quitting
let mapleader = ' '
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Shortcuts for editing .rc files
nnoremap <Leader>v :e ~/.vimrc<CR>
nnoremap <Leader>b :e ~/.bashrc<CR>

" Shortcuts for formatting, exporting, and viewing markdown files
nnoremap <Leader>mf :w \| :Dispatch! prettier % --write<CR>
nnoremap <Leader>mc :w \| :Dispatch! pandoc -i % -o ~/Exports/%:r.pdf<CR>
nnoremap <Leader>mh :w \| :Dispatch! pandoc -i % -o %:r.html --mathjax<CR>
nnoremap <Leader>mv :Dispatch! zathura ~/Exports/%:r.pdf &<CR>
nnoremap <Leader>mp :MarkdownPreview<CR>
