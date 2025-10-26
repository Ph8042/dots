"
"    /$$    /$$ /$$$$$$ /$$      /$$        /$$$$$$   /$$$$$$  /$$   /$$ /$$$$$$$$ /$$$$$$  /$$$$$$ 
"   | $$   | $$|_  $$_/| $$$    /$$$       /$$__  $$ /$$__  $$| $$$ | $$| $$_____/|_  $$_/ /$$__  $$
"   | $$   | $$  | $$  | $$$$  /$$$$      | $$  \__/| $$  \ $$| $$$$| $$| $$        | $$  | $$  \__/
"   |  $$ / $$/  | $$  | $$ $$/$$ $$      | $$      | $$  | $$| $$ $$ $$| $$$$$     | $$  | $$ /$$$$
"    \  $$ $$/   | $$  | $$  $$$| $$      | $$      | $$  | $$| $$  $$$$| $$__/     | $$  | $$|_  $$
"     \  $$$/    | $$  | $$\  $ | $$      | $$    $$| $$  | $$| $$\  $$$| $$        | $$  | $$  \ $$
"      \  $/    /$$$$$$| $$ \/  | $$      |  $$$$$$/|  $$$$$$/| $$ \  $$| $$       /$$$$$$|  $$$$$$/
"       \_/    |______/|__/     |__/       \______/  \______/ |__/  \__/|__/      |______/ \______/ 
"                                                                                                
"                                                                                                
"    /$$                                 /$$        /$$$$$$                       /$$$$$$           
"   | $$                                | $$       /$$__  $$                     /$$__  $$          
"   | $$$$$$$  /$$   /$$        /$$$$$$ | $$$$$$$ |__/  \ $$ /$$   /$$  /$$$$$$$| $$  \ $$          
"   | $$__  $$| $$  | $$       /$$__  $$| $$__  $$  /$$$$$$/|  $$ /$$/ /$$_____/|  $$$$$$/          
"   | $$  \ $$| $$  | $$      | $$  \ $$| $$  \ $$ /$$____/  \  $$$$/ | $$       >$$__  $$          
"   | $$  | $$| $$  | $$      | $$  | $$| $$  | $$| $$        >$$  $$ | $$      | $$  \ $$          
"   | $$$$$$$/|  $$$$$$$      | $$$$$$$/| $$  | $$| $$$$$$$$ /$$/\  $$|  $$$$$$$|  $$$$$$/          
"   |_______/  \____  $$      | $$____/ |__/  |__/|________/|__/  \__/ \_______/ \______/           
"              /$$  | $$      | $$                                                                  
"             |  $$$$$$/      | $$                                                                  
"              \______/       |__/                                                                                                                                                                  
" mappings
let mapleader =" "
map <leader>q :q<CR>
map <leader>w :w<CR>
map <leader>m :!./build.sh<CR>
map <leader>e :Ex<CR>
map <leader>t :term<CR>
map <leader>v :vsplit<CR>
map <leader>h :split<CR>
map <leader>s :source%<CR>

" basic settings
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
set scrolloff=4
set smartindent
set path+=** " allow to search thru sub directories 

" look and style
colorscheme handmade-hero
"colorscheme desert
syntax on
set termguicolors

" functions and features
map <C-p> :cprev<CR>
map <C-n> :cnext<CR>
map <leader>o :copen<CR>
map <leader>vg :vimgrep '' **/*<Left><Left><Left><Left><Left><Left>



