unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 显示相关  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  

"winpos 5 5          " 设定窗口位置  

"set lines=40 columns=155    " 设定窗口大小  

""关闭响铃
""set vb t_vb=

set nu              " 显示行号  

set go=             " 不要图形按钮  

"color asmanian2     " 设置背景主题  

set guifont=Courier_New:h10:cANSI   " 设置字体  


autocmd InsertLeave * se nocul  " 用浅色高亮当前行  

autocmd InsertEnter * se cul    " 用浅色高亮当前行  

set ruler           " 显示标尺  

set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

set showcmd         " 输入的命令显示出来，看的清楚些  

set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  

set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  

set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  

"set foldenable      " 允许折叠  

"set foldmethod=manual   " 手动折叠  

"set background=dark "背景使用黑色 


" 显示中文帮助

if version >= 603

    set helplang=cn

    set encoding=utf-8

endif

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

set termencoding=utf-8

set encoding=utf-8

set fileencodings=ucs-bom,utf-8,cp936

set fileencoding=utf-8

" 设置配色方案

"colorscheme murphy

"字体 

"if (has("gui_running")) 

"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 

"endif 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"新建.c,.h,.sh,.java文件，自动插入文件头 

""autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()" 
""
""""定义函数SetTitle，自动插入文件头 
""
""func SetTitle() 
""
""    "如果文件类型为.sh文件 
""
""		if &filetype == 'sh' 
""
""				call setline(1,"\#########################################################################") 
""
""				call append(line("."), "\# File Name: ".expand("%")) 
""
""				call append(line(".")+1, "\# Author: Kgod") 
""
""				call append(line(".")+2, "\# mail: 17621512033@163.com") 
""
""				call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
""
""				call append(line(".")+4, "\#########################################################################") 
""
""				call append(line(".")+5, "\#!/bin/bash") 
""
""				call append(line(".")+6, "") 
""
""				
""		""elseif &filetype == 'python'
""
""		""		call setline(1,"\#########################################################################") 
""
""		""		call append(line("."), "\# File Name: ".expand("%")) 
""
""		""		call append(line(".")+1, "\# Author: Kgod") 
""
""		""		call append(line(".")+2, "\# mail: 17621512033@163.com") 
""
""		""		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
""
""		""		call append(line(".")+4, "\#########################################################################") 
""
""		""		call append(line(".")+5, "\#!usr/bin/python3") 
""
""		""		call append(line(".")+6, "") 
""		
""		else 
""
""				call setline(1, "/*************************************************************************") 
""				""call setline(1, "/*==========================================================================") 
""				""call setline(1,"\#########################################################################") 
""
""				call append(line("."), "    \# File Name: ".expand("%")) 
""
""				call append(line(".")+1, "    \# Author: Kgod") 
""
""				call append(line(".")+2, "    \#> Mail: 17621512033@163.com ") 
""
""				call append(line(".")+3, "    \# Created Time: ".strftime("%c")) 
""
""				""call append(line(".")+4, " ================================================================*/") 
""				""call setline(4,"\#########################################################################") 
""				call append(line(".")+4, "*************************************************************************/") 
""
""				call append(line(".")+5, "")
""
""		endif
""
""		if &filetype == 'cpp'
""
""				call append(line(".")+6, "#include<iostream>")
""
""				call append(line(".")+7, "using namespace std;")
""
""				call append(line(".")+8, "")
""
""		endif
""
""		if &filetype == 'c'
""
""				call append(line(".")+6, "#include<stdio.h>")
""
""				call append(line(".")+7, "")
""
""		endif
""
""		if &filetype == 'cc'
""
""				call append(line(".")+6, "#include<stdio.h>")
""
""				call append(line(".")+7, "using namespace std;")
""
""				call append(line(".")+8, "")
""
""		endif
""		if &filetype == 'java'
""
""				"call append(line(".")+6, "public class ".expand("%r"))
""
""				call append(line(".")+6, "")
""
""		endif
""
""endfunc 
""
"""新建文件后，自动定位到文件末尾
""autocmd BufNewFile * normal G 
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""C_header
autocmd bufnewfile *.c so /etc/vim/vi_configuration/c_header.txt
autocmd bufnewfile *.c exe "1," . 7 . "g/File Name:.*/s//File Name:" .expand("%")
autocmd bufnewfile *.c exe "1," . 7 . "g/Create Date:.*/s//Create Date:" .strftime("%Y-%m-%d %H:%m:%S")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 7 . "g/Last Modified:.*/s//Last Modified:" .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""py_header
autocmd bufnewfile *.py so /etc/vim/vi_configuration/py_header.txt
autocmd bufnewfile *.py exe "1," . 7 . "g/File Name:.*/s//File Name:" .expand("%")
autocmd bufnewfile *.py exe "1," . 7 . "g/Create Date:.*/s//Create Date:" .strftime("%Y-%m-%d %H:%m:%S")
autocmd Bufwritepre,filewritepre *.py execute "normal ma"
autocmd Bufwritepre,filewritepre *.py exe "1," . 7 . "g/Last Modified:.*/s//Last Modified:" .strftime("%c")
autocmd bufwritepost,filewritepost *.py execute "normal `a"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""sh_header
autocmd bufnewfile *.sh so /etc/vim/vi_configuration/sh_header.txt
autocmd bufnewfile *.sh exe "1," . 7 . "g/File Name:.*/s//File Name:" .expand("%")
autocmd bufnewfile *.sh exe "1," . 7 . "g/Create Date:.*/s//Create Date:" .strftime("%Y-%m-%d %H:%m:%S")
autocmd Bufwritepre,filewritepre *.sh execute "normal ma"
autocmd Bufwritepre,filewritepre *.sh exe "1," . 7 . "g/Last Modified:.*/s//Last Modified:" .strftime("%c")
autocmd bufwritepost,filewritepost *.sh execute "normal `a"
autocmd BufNewFile * normal G 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"键盘命令

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>

nmap <leader>f :find<cr>


map <C-A> ggVGY

map! <C-A> <Esc>ggVGY

map <F12> gg=G

" 选中状态下 Ctrl+c 复制

vmap <C-c> "+y




"C，C++ 等按F5编译运行

map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()

    exec "w"

    if &filetype == 'c'

        exec "!g++ % -o %<"

        exec "! ./%<"

    elseif &filetype == 'cpp'

        exec "!g++ % -o %<"

        exec "! ./%<"

    elseif &filetype == 'java' 

        exec "!javac %" 

        exec "!java %<"

    elseif &filetype == 'sh'

		:!time bash %
    
	elseif &filetype == 'python'

		exec "!time python %" 
		
	elseif &filetype == 'html'
		
		exec "!firefox % &"

	elseif &filetype == 'go'
		
		exec "!go build %<"
	
		exec "!time go run %"
	
	endif

endfunc

"识别.py *py
"an BufRead,BufNewFile*.py set filetype=py

"C,C++的调试

map <F8> :call Rungdb()<CR>

func! Rungdb()

    exec "w"

    exec "!g++ % -g -o %<"

    exec "!gdb ./%<"

endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""实用设置

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on "语法高亮

syntax enable

set background=light
""set background=dark

""if has('gui_running')
""    set background=light
""else
""    set background=dark
""endif

colorscheme solarized

" 在处理未保存或只读文件的时候，弹出确认

set confirm

" 自动缩进

set autoindent

set cindent

" Tab键的宽度

set tabstop=4

" 统一缩进为4

set softtabstop=4

set shiftwidth=4

" 不要用空格代替制表符

set noexpandtab

" 在行和段开始处使用制表符

set smarttab

" 历史记录数

set history=1000

"禁止生成临时文件

set nobackup

set noswapfile

"搜索忽略大小写

set ignorecase

"搜索逐字符高亮

set hlsearch

set incsearch

"行内替换

set gdefault

" 总是显示状态行

set laststatus=2

" 命令行（在状态行下）的高度，默认为1，这里是2

set cmdheight=1

" 保存全局变量

set viminfo+=!

" 带有如下符号的单词不要被换行分割

set iskeyword+=_,$,@,%,#,-

" 字符间插入的像素行数目

set linespace=0

" 增强模式中的命令行自动完成操作

set wildmenu

" 使回格键（backspace）正常处理indent, eol, start等

"set backspace=2

" 允许backspace和光标键跨越行边界

set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）

set mouse=a

set selection=exclusive

set selectmode=mouse,key

" 通过使用: commands命令，告诉我们文件的哪一行被改变过

set report=0

" 在被分割的窗口间显示空白，便于阅读

set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号

"set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）

set matchtime=1

" 光标移动到buffer的顶部和底部时保持3行距离

set scrolloff=3

" 为C程序提供自动缩进

set smartindent


" 高亮显示普通txt文件（需要txt.vim脚本）//有问题
"au BufRead,BufNewFile *  setfiletype txt


" 设置当文件被改动时自动载入

set autoread

" quickfix模式

autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"代码补全 

set completeopt=preview,menu 



"共享剪贴板  

set clipboard+=unnamed 

"从不备份  

set nobackup

"make 运行

:set makeprg=g++\ -Wall\ \ %

"自动保存

set autowrite

set ruler                   " 打开状态栏标尺

set cursorline              " 突出显示当前行

set magic                   " 设置魔术

set guioptions-=T           " 隐藏工具栏

set guioptions-=m           " 隐藏菜单栏

""syntastic配置
""set statusline+=%#warningmsg#
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0


"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\

" 设置在状态行显示的信息

"set foldcolumn=0

"set foldmethod=indent 

"set foldlevel=3 

"set foldenable              " 开始折叠

" 不要使用vi的键盘模式，而是vim自己的

set nocompatible


"自动补全

:inoremap ( ()<ESC>i

"":inoremap < <><ESC>i

:inoremap { {}<ESC>i

:inoremap ) <c-r>=ClosePair(')')<CR>

":inoremap { {<CR>}<ESC>O

":inoremap } <c-r>=ClosePair('}')<CR>

:inoremap [ []<ESC>i

:inoremap ] <c-r>=ClosePair(']')<CR>

:inoremap " ""<ESC>i

:inoremap ' ''<ESC>i

function! ClosePair(char)

    if getline('.')[col('.') - 1] == a:char

        return "\<Right>"

    else

        return a:char

    endif

endfunction

filetype plugin indent on 

"打开文件类型检测, 加了这句才可以用智能补全

set completeopt=longest,menu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Search & Matching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"搜索时高亮显示被找到的文本
set hls
"搜索忽略大小写
set ignorecase
"匹配括号高亮的时间（单位是十分之一秒）
set matchtime=2
"高亮被搜索的句子 nohlsearch为不高亮
set hlsearch
"在搜索时，输入的词句的逐字符高亮
set incsearch
"高亮显示匹配的括号
set showmatch


""let g:vim_markdown_frontmatter=1
""let g:instant_markdown_slow = 1
""let g:instant_markdown_autostart = 1
""let g:instant_markdown_allow_unsafe_content = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
""Plug 'tpope/vim-sensible'
""Plug 'junegunn/seoul256.vim'
""Plug 'iamcco/mathjax-support-for-mkdp'
""Plug 'iamcco/markdown-preview.vim'


call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on


" 启用vundle来管理vim插件
filetype off "必须
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 安装插件写在这之后
Plugin 'VundleVim/Vundle.vim'
""Tagbar
""Plugin 'majutsushi/tagbar'
" let Vundle manage Vundle, required
""缩进指示线
""Plugin 'Yggdroot/indentLine'
""Plugin 'godlygeek/tabular'
""Plugin 'plasticboy/vim-markdown'
""Plugin 'suan/vim-instant-markdown'
""Plugin 'JamshedVesuna/vim-markdown-preview' 
""Plugin 'file://home/kgod/Download/vim-instant-markdown-master/after/ftplugin'
""Plugin 'iamcco/mathjax-support-for-mkdp'
""Plugin 'iamcco/markdown-preview.vim'

""美化状态栏
Bundle 'Lokaltog/vim-powerline'

" 安装插件写在这之前
call vundle#end() " required
filetype plugin indent on "required
""filetyp plugin on

" required" 常用命令
" :PluginList - 查看已经安装的插件
" :PluginInstall - 安装插件
" :PluginUpdate - 更新插件
" :PluginSearch - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean - 删除插件，把安装插件对应行删除，然后执行这个命令即可

" h: vundle - 获取帮助


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"去空行  
"nnoremap <F2> :g/^\s*$/d<CR> 

"nnoremap <silent> <F5> :NERDTree<CR>

"显示树状"
map <F2> :NERDTreeToggle<CR>
map <F3> <plug>NERDTreeTabsToggle<CR>
map <Ctrl>f <plug>NERDTreeTabsFind<CR>

execute pathogen#infect() 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"nerdcommenter
let mapleader=","
set timeout timeoutlen=1500





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""indentLine
""let g:indentLine_setColors = 0
let g:indentLine_char='|'
""let g:indentLine_char='┆'


""tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30 ""宽度
let g:tagbar_left=1 ""左边

""powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols= 'unicode'
set encoding=utf8


""多屏切换
map gh <C-W>h ""左
map gj <C-W>j ""下
map gk <C-W>k ""上
map gl <C-W>l ""右
map gw <C-W>w ""切换



