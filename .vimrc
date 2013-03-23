syntax on

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent
autocmd BufEnter * lcd %:p:h

" Allow modified buffers to be hidden
set hidden

" prevent accidental scrolls in insert mode
imap jj <ESC>

" Swap between header/source
map <Tab> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" next/previous buffer
noremap <C-S-Tab> :bprev<CR> 
noremap <C-Tab> :bnext<CR> 

" resize splits w/ ctrl + arrows
map <C-Down> <C-W>+
map <C-Up> <C-W>-
map <C-Left> <C-W><
map <C-Right> <C-W>>

" ctrl-hjkl to swap splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" ctrl-M to maximize split
map <C-M> <C-W>_
" max height for split = 0
set wmh=0

colorscheme slate

" Only bother with most of the snazzy plugin stuff if we're in gVim
if has("gui_running")

	colorscheme zenburn

  " Get rid of pointless icon menubar thing
	set guioptions-=T
	set gfn=Bitstream\ Vera\ Sans\ Mono\ 9

  " enter NERDTree automatically when entering VIM
	autocmd VimEnter * NERDTree 
	autocmd BufEnter * NERDTreeMirror " add folder tree to the left hand side for each tab
	let NERDTreeIgnore=['*\.o$']
	let NERDTreeIgnore=['*\.class$']

  " taglist on right
	autocmd VimEnter * TlistToggle
	let Tlist_Use_Right_Window = 1

endif


" --- OmniCppComplete ---
set nocp " non vi compatible mode
filetype plugin on " enable plugins
au BufNewFile,BufRead,BufEnter *.cpp,*.h set omnifunc=omni#cpp#complete#Main

" auto close options when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone

" -- configs --
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" -- ctags --
" map <ctrl>+F12 to generate ctags for current folder:
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
map <C-F11> :set tags+=./tags
set tags+=~/.vimtags/cpp
set tags+=~/.vimtags/gl
set tags+=~/.vimtags/sdl
set tags+=~/.vimtags/oryx
set tags+=~/.vimtags/oyster

