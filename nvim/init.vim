set ttimeoutlen=10

set encoding=utf-8
scriptencoding utf-8
set ambiwidth=double

set nowrap
set number
set title
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set wrapscan
set spell
set spelllang=en,cjk
set noswapfile
"clip board
set clipboard=unnamedplus
set background=dark


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/arch/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/arch/.cache/dein')
  call dein#begin('/home/arch/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/arch/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  let s:toml = '~/dotfiles/nvim/dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
"-----------------------------------------------------------------------
"terminal setting
"-----------------------------------------------------------------------
tnoremap <silent> <ESC> <C-\><C-n>
nnoremap @t :tabe<CR>:terminal<CR>
" NERDtree setting
"
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('vue',    'Green', 'none', '#42b883', '#151515')


"-----------------------------------------------------------------------
" Air line cuctom
"-----------------------------------------------------------------------
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='onedark'
" タブバーをかっこよく
let g:airline#extensions#tabline#enabled = 1

"-----------------------------------------------------------------------
"tab setting
"-----------------------------------------------------------------------

function! LightlineFugitive()
 if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
   return fugitive#head()
 else
   return ''
 endif
endfunction

function! LightlineFileformat()
 return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
 return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
 return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
 return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

set showtabline=2 " 常にタブラインを表示

" Anywhere SID.
function! s:SID_PREFIX()
 return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
 execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

vmap <S-C-k> <Plug>(caw:hatpos:toggle)
