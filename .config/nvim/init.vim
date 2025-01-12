" 2025-01-11 init.vim by ph2xc8
" dependencies: fzf, ripgrep, bat
"
" if string grep fzf from bat still doesnt show preview u re missing a link
" sudo ln -s /usr/bin/batcat /usr/local/bin/bat
" 

let mapleader =" "

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'creaturephil/vim-handmade-hero'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
call plug#end()

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

set number
set relativenumber
set encoding=utf-8
set mouse=a
set showcmd
set expandtab
set tabstop=4
set shiftwidth=4
set nohlsearch
set title
set noruler
set laststatus=0
set bg=dark
filetype plugin on
syntax on
set scrolloff=8
set cindent
set smartindent
set colorcolumn=80
"highlight colorcolumn ctermbg=8 guibg=#cccccc
" colorscheme default
" colorscheme desert
" colorscheme murphy
" colorscheme pablo
" colorscheme ron
" colorscheme torte
colorscheme handmade-hero
highlight ColorColumn ctermbg=darkgrey guibg=#2E3440

let g:markdown_fenced_languages = ['html', 'c', 'bash']
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let $FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up'
"let g:airline_theme='simple'
let g:airline_theme='ubaryd'

" function! SearchInFiles()
"   let query = input('Search for > ')
"   let command = 'rg --vimgrep --smart-case ' . shellescape(query)
"   call fzf#vim#grep(command, 1, {'options': '--delimiter=: --preview "bat --style=numbers --color=always {1} --highlight-line={2}"'})
" endfunction

" maps
" nnoremap <leader>s :call SearchInFiles()<CR>
" nnoremap <leader>f :Files .<CR>
nnoremap <leader>g :Goyo \| set bg=dark\| set linebreak<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>m :!./build.sh<CR>
nnoremap <leader>r :!./build.sh && ./out<CR>
" gc is a comment (default from plugin)
" cs is a surround change, ex.: cs"' to change from "text" to 'text'
nnoremap <leader>e :Ex<CR>


" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<CR>
nnoremap <leader>s <cmd>Telescope live_grep<CR>
" nnoremap <leader>fb <cmd>Telescope buffers<CR>
" nnoremap <leader>fh <cmd>Telescope help_tags<CR>

" Harpoon control
nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <C-]> :lua require("harpoon.ui").nav_next()<CR> 
nnoremap <C-[> :lua require("harpoon.ui").nav_prev()<CR> 
