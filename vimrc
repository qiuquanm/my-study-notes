" Setting some decent VIM settings for programming
set nu                          "�����к�"
set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set ruler                       " show the cursor position all the time
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set backspace=indent,eol,start  " make that backspace key work the way it should
set nocompatible                " vi compatible is LAME
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows
syntax on                       " turn syntax highlighting on by default

" Show EOL type and last modified timestamp, right after the filename
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

"------------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    "Set UTF-8 as the default encoding for commit messages
    autocmd BufReadPre COMMIT_EDITMSG,git-rebase-todo setlocal fileencodings=utf-8

    "Remember the positions in files with some git-specific exceptions"
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$")
      \           && expand("%") !~ "COMMIT_EDITMSG"
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff"
      \           && expand("%") !~ "git-rebase-todo" |
      \   exe "normal g`\"" |
      \ endif

      autocmd BufNewFile,BufRead *.patch set filetype=diff
      autocmd BufNewFile,BufRead *.diff set filetype=diff

      autocmd Syntax diff
      \ highlight WhiteSpaceEOL ctermbg=red |
      \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/

      autocmd Syntax gitcommit setlocal textwidth=74
endif " has("autocmd")






set nu
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
 
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
 
 
"�����ļ��Ĵ�����ʽ utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
 
"vim�Ĳ˵�������
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"vim��ʾ��Ϣ����Ľ��
language messages zh_CN.utf-8
 
filetype on
filetype plugin indent on
"colorscheme evening	"��ɫ����
colorscheme desert
set helplang=cn		"�������İ���
set history=500		"������ʷ��¼
set guifont=Monaco:h10	"��������ΪMonaco����С10
set tabstop=4		"����tab������
set expandtab
set backspace=2 	"�����˸������
"set nu! 		"������ʾ�к�
set wrap 		"�����Զ�����
"set nowrap 		"���ò��Զ�����
set linebreak 		"���ʻ��У����Զ����д���ʹ��
"set list 		"��ʾ�Ʊ��
set autochdir 		"�Զ����õ�ǰĿ¼Ϊ���ڱ༭��Ŀ¼
set hidden 		"�Զ�����û�б���Ļ��������л�bufferʱ���������浱ǰbuffer����ʾ
set scrolloff=5 	"�ڹ��ӽ��׶˻򶥶�ʱ���Զ��¹����Ϲ�
"Toggle Menu and Toolbar 	"���ز˵����͹�����
"set guioptions-=m
"set guioptions-=T
set showtabline=2 	"����������ʾ��ǩ��
set autoread 		"���õ��ļ����ⲿ���޸ģ��Զ����¸��ļ�
set mouse=a 		"�������κ�ģʽ����궼����
set nobackup 		"���ò����ɱ����ļ�
"set go=				"��Ҫͼ�ΰ�ť
set guioptions-=T           " ���ع�����
"set guioptions-=m           " ���ز˵���
 
"===========================
"����/�滻��ص�����
"===========================
set hlsearch "������ʾ���ҽ��
set incsearch "��������
 
"===========================
"״̬��������
"===========================
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "��ʾ�ļ��������������ܵ��ַ���
"set ruler "�ڱ༭�����У������½���ʾ���λ�õ�״̬��
 
"===========================
"��������
"===========================
syntax enable "���﷨����
syntax on "���﷨����
set showmatch "����ƥ��ģʽ���൱������ƥ��
set smartindent "���ܶ���
"set shiftwidth=4 "����ʱ������ʹ��4���ո�
set autoindent "�����Զ�����
set ai! "�����Զ�����
"set cursorcolumn "���ù����
set cursorline	"���ù����
set guicursor+=a:blinkon0 "���ù�겻��˸
set fdm=indent "
 
 
"�������
set rtp+=$VIM\vimfiles\bundle\Vundle.vim\
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'kien/ctrlp.vim'
"Plugin 'eshion/vim-sync'
"call vundle#end()
 
" �ر�NERDTree��ݼ�
map <leader>t :NERDTreeToggle<CR>
" ��ʾ�к�
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" �Ƿ���ʾ�����ļ�
let NERDTreeShowHidden=1
" ���ÿ��
let NERDTreeWinSize=21
" ���ն�����vimʱ������NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" ����һ���ļ�����ʾ
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" ��ʾ��ǩ�б�
let NERDTreeShowBookmarks=1
