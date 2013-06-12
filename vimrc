" References and Samples:
"  - http://eseth.org/filez/prefs/vimrc
"  - http://wyw.dcweb.cn/vim//
"  - http://www.dotfiles.com/files/9/148_.vimrc and http://www.dotfiles.com/index.php?app_id=9
"  - http://www.noah.org/engineering/dotfiles/.vimrc
"  - http://ciaranm.wordpress.com/tag/vim/
"
" Tips:
"  - see all current settings: set all
"  - trace last change to one or more settings: verbose set backspace cindent

set nocompatible

if has("autocmd")
    autocmd!
  " automatic change to directory of file in buffer
  " autocmd BufEnter * :lcd %:p:h
  " currently commented out do to problem after :make with [javac] prefix in ant output
    autocmd BufWritePre * let &backupext = '-' . strftime("%Y%m%d-%H%M") . '.bak'
    autocmd BufWinEnter * syntax sync fromstart
"    autocmd BufWinEnter * setlocal statusline=%!GetStatusLine(winwidth(0))
    autocmd BufWinEnter * setlocal statusline=%{GetStatusLine(winwidth(0))}
    autocmd WinEnter,BufEnter * setlocal cursorline
    autocmd WinLeave,BufLeave * setlocal nocursorline
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

" File Save and Backup
set noautowrite
set noautowriteall
set backup
set backupcopy=yes
if isdirectory('/cygdrive/c/backup/vim/cygwin')
    " Put this first as the windows test will succeed under cygwin
    set backupdir=/cygdrive/c/backup/vim/cygwin,.
elseif isdirectory(expand("$HOME/backup/vim"))
    let &backupdir = expand("$HOME/backup/vim,.")
elseif isdirectory('c:/backup/vim/windows')

    set backupdir=c:/backup/vim/windows,.
endif

" VIM Behaviour
set backspace=indent,eol,start
set history=200                         " Lines of command history to remember
"set keymodel=startsel
set patchmode=
set scrolloff=2                         " Always keep 2 lines of context visible when scrolling
"set selectmode=key,mouse
set sidescroll=2
set sidescrolloff=5                     " Always keep 5 columns of context visible when scrolling
set switchbuf=usetab,split
set whichwrap=b,s,<,>,[,],h,l           " Allow cursor movement to wrap

" File Format and Inserted Characters
set autoindent
set expandtab
set fileformats=unix,dos,mac
set nocindent
set nosmartindent
set shiftwidth=4
set smartindent
set tabstop=4
set softtabstop=4

" File Rendering - affects display but not persisted content
set linebreak
set wrap

" Visual Chrome Formatting
set background=dark
set cmdheight=3
set display=lastline,uhex
set fillchars=
if has("folding")
    set foldenable
    set foldcolumn=5
    set foldlevelstart=3
    set foldmethod=indent
    set foldminlines=1
endif
set laststatus=2                        " Always Show Status Line
set linespace=0
set list
set listchars=eol:$,tab:^I,trail:=,extends:+
set number
set ruler
set shortmess=fiIlnxtToO
function! FileFormatNotDos(var)
    if (a:var == 'unix')
        return '[UNIX]'
    elseif (a:var == 'mac')
        return '[MAC]'
    else
        return ''
    endif
endfunction
function! FileFormatNotUnix(var)
    if (a:var == 'unix')
        return ''
    else
        return ',' . toupper(a:var)
    endif
endfunction
function! EncodingNotLatin1(var)
    if (a:var == 'Latin1')
        return ''
    else
        return ',' . a:var
    endif
endfunction
function! FoldStatus(foldEnable, foldMethod, foldLevel)
    if (a:foldEnable)
        return strpart(a:foldMethod, 0, 3) . '-' . a:foldLevel
    else
        return 'off'
    endif
endfunction
function! LineLength()
    return col("$")-1
endfunction
function! GetStatusLine(width)
    let l:result=''
    if (a:width > 30)
        let l:result.='%-12.25F %<%a '                        " Filename [truncate here] (x of y)
    else
        let l:result.='%-12.15t %<%a '                        " Filename [truncate here] without path (x of y)
    endif
    let l:result.='%='                                        " Separation of left and right aligned segments
    if (a:width > 20)
        let l:result.='%1*%{FileFormatNotDos(&fileformat)}%* '    " Highlight UNIX filetype
    endif
    if (a:width > 50)
        let l:result.='[%M%n%R%Y%{FileFormatNotUnix(&fileformat)}'   " Modified, Buffer Number, Readonly, Filetype, Fileformat if not Unix
        let l:result.='%{EncodingNotLatin1(&encoding)}] '     " File encoding if not Latin1
    elseif (a:width > 20)
        let l:result.='[%M%n%R%Y] '                           " Modified, Buffer Number, Readonly, Filetype
    endif
    if (a:width > 70)
        let l:result.='f:%{FoldStatus(&foldenable,&foldmethod,&foldlevel)} '     " Folding Status
    endif
    if (a:width > 100)
        let l:result.='c:%03b/0x%02B '                        " Value of byte under cursor in decimal and hex
        let l:result.='o:%o/0x%O '                            " Offset of current byte from start of file in decimal and hex
    endif
    if (a:width > 45)
        if (a:width > 65)
            let l:result.='p:%l/%L,%c/%{LineLength()} '       " current and total lines and columns
        else
            let l:result.='p:%l,%c '                          " current line and column
        endif
    endif
    if (a:width > 15)
        let l:result.='%p%%'                                  " Percentage through file
    endif
    return expand(l:result)
endfunction

" set statusline=%!GetStatusLine()

set showbreak=-->
set showcmd
set showfulltag
" Nice window title
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                                              " file name
    set titlestring+=%h%m%r%w                                         " flags
    set titlestring+=\ -\ %{v:progname}                               " program name
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}  " working directory
endif
set winheight=5
set winminheight=5

" Searching
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan
set tags=~/tags
set showfulltag
set path=.,,~\**
set cdpath=,,~\**

colorscheme my-evening
syntax on
syntax sync fromstart

function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction
"inoremap <tab> <tab>=InsertTabWrapper ("forward")
"inoremap <tab> <c-r>=InsertTabWrapper ("backward")

" Maps Omnicompletion to CTRL-space since ctrl-x ctrl-o is hard to reach
inoremap <Nul> <C-x><C-o>

" Paste from clipboard
nnoremap <Insert> "*p
inoremap <Insert> <C-O>"*p

" Save
nnoremap <C-s> :update<CR>
inoremap <C-s> <C-O>:update<CR>
" Undo
nnoremap <C-z> :undo<CR>
inoremap <C-z> <C-O>:undo<CR>
" Cycle forward tab
nnoremap <C-Tab> :tabnext<CR>
inoremap <C-Tab> <C-O>:tabnext<CR>
" Cycle backward tab
nnoremap <C-S-Tab> :tabprevious<CR>
inoremap <C-S-Tab> <C-O>:tabprevious<CR>

" Cycle up window
nnoremap <C-S-Up> <C-W>k
inoremap <C-S-Up> <C-O><C-W>k
" Up within a wrapped line
nnoremap <M-Up> gk
inoremap <M-Up> <C-O>gk
" Cycle down window
nnoremap <C-S-Down> <C-W>j
inoremap <C-S-Down> <C-O><C-W>j
" Down within a wrapped line
nnoremap <M-Down> gj
inoremap <M-Down> <C-O>gj
" Cycle right window
nnoremap <C-S-Right> <C-W>l
inoremap <C-S-Right> <C-O><C-W>l
" Cycle left window
nnoremap <C-S-Left> <C-W>h
inoremap <C-S-Left> <C-O><C-W>h

" Remove hilight after searching
nnoremap <F3> :nohl<CR>
inoremap <F3> <C-O>:nohl<CR>
" Close window
nnoremap <C-F4> <C-W>q
inoremap <C-F4> <C-O><C-W>q
" Cycle forward one window
nnoremap <F6> <C-W>w
inoremap <F6> <C-O><C-W>w
" Cycle backward one window
nnoremap <S-F6> <C-W>W
inoremap <S-F6> <C-O><C-W>W

" Abbreviations
ab sop System.out.println(

"set makeprg=yogi-compile
command! -nargs=* Make make <args> | cwindow 6
let mapleader=","
map <Leader>m :Make<cr>
"set errorformat=%A%*\s%[javac%\]\ %f:%l:\ %m,%Z%*\s%[javac%\]\ symbol%*\s:\ %m
setlocal errorformat=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
    \%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

"set makeprg=~/bin/php.sh\ %
set makeprg=C:/Progra~1/nusphere/phped/php5/php.exe\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
"set mp=make\ \\\|&\ error_filter
"set errorformat=%m@%f@%l
"set errorfile=C:\Temp\vim-errorfile
"set makeef=C:\Temp\vim-errorfile

set wildmenu
set wildmode=longest:full

" TODO: Set this only for .vimrc and colors etc...
nnoremap <F5> :call Refresh()<CR>
inoremap <F5> <C-O>:call Refresh()<CR>

" Shift-F1 to display the Syntax Highlight group under the cursor
nnoremap <S-F1> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . "> bg<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg") . " "
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg#") . "> fg<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg") . " "
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#") . ">"<CR>
inoremap <S-F1> <C-O>:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . "> bg<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg") . " "
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg#") . "> fg<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg") . " "
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#") . ">"<CR>

" % used to match tags and open / close statements in addition to brackets
runtime macros/matchit.vim

" For further inspiration, see: https://wiki.archlinux.org/index.php/Vimrc#Vimrc
function! RetabSpaces()
    set expandtab
    execute 'retab!'
    call StripEolWhitespace()
endfunction
function! RetabTabs()
    set noexpandtab
    execute 'retab!'
    call StripEolWhitespace()
endfunction
function! StripEolWhitespace()
    execute '%s/\v( |\t)+$//'
endfunction

" vim: set ai ci nocin et ff=unix nu nopi si sts=4 sw=4 ts=4 tw=0 wm=0 :
