syntax enable
set termguicolors
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                         "
"                                  Vundle                                 "
"                                                                         "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

                      """""""""""""""""""""""""""""""""""""
                      "                                   "
                      "               Base                "
                      "                                   "
                      "                                   "
                      """""""""""""""""""""""""""""""""""""

" Basic "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'L9'


" Theme "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'flazz/vim-colorschemes'


                      """""""""""""""""""""""""""""""""""""
                      "                                   "
                      "            VIM Improve            "
                      "                                   "
                      "                                   "
                      """""""""""""""""""""""""""""""""""""

" Basic "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'The-NERD-Commenter'
Plugin 'matchit.zip'


" Shortcuts "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'The-NERD-tree'
    nmap <C-b> :NERDTree <cr> :set rnu <cr>
    nmap <C-t> :tabnew <cr>
    let NERDTreeIgnore          = ['\.$','\~$']
    let NERDTreeShowBookmarks   = 1
    let NERDTreeShowFiles       = 1
    let NERDTreeShowHidden      = 1
    let NERDTreeShowLineNumbers = 1
    let NERDTreeWinPos          = 1
    " usage: <C-t>

Plugin 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup = 1

Plugin 'nginx.vim'
    au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,/usr/local/etc/nginx/* if &ft == '' | setfiletype nginx | endif

" Plugin 'airblade/vim-gitgutter'

Plugin 'terryma/vim-multiple-cursors'
    let g:multi_cursor_use_default_mapping = 1
    " let g:multi_cursor_next_key='<C-n>'
    " let g:multi_cursor_prev_key='<C-p>'
    " let g:multi_cursor_skip_key='<C-x>'
    " let g:multi_cursor_quit_key='<Esc>'
    " usage: select & <C-n>


" Complete & Promot"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Plugin 'supertab'

Plugin 'Valloric/YouCompleteMe'
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_use_ultisnips_completer = 1
    let g:ycm_key_list_select_completion = ['<Down>']
    let g:ycm_key_list_previous_completion = ['<Up>']

Plugin 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    "let g:UltiSnipsSnippetDirectories  = ["snips"]
    function! g:UltiSnips_Complete()
        call UltiSnips#ExpandSnippet()
        if g:ulti_expand_res == 0
            if pumvisible()
                return "\<C-n>"
            else
                call UltiSnips#JumpForwards()
                if g:ulti_jump_forwards_res == 0
                   return "\<TAB>"
                endif
            endif
        endif
        return ""
    endfunction
    au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

Plugin 'honza/vim-snippets'

Plugin 'jiangmiao/auto-pairs'

" VIM StatusLine "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'
    set laststatus=2
    highlight Search guifg=#b58900 gui=reverse guibg=NONE term=reverse ctermfg=NONE cterm=reverse ctermbg=NONE
    let g:airline_theme = 'solarized'
    let g:solarized_termcolors = 16
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#bufferline#enabled = 1
    " let g:airline#extensions#hunks#enabled = 1
    let g:airline_theme_patch_func = 'AirlineThemePatch'
    function! AirlineThemePatch(palette)
      if g:airline_theme == 'solarized'
        for colors in values(a:palette.inactive)
          let colors[0] = '#93a1a1'
          let colors[1] = '#000000'
          let colors[2] = 14
          let colors[3] = 7
        endfor
      endif
    endfunction


                      """""""""""""""""""""""""""""""""""""
                      "                                   "
                      "        Programming Plugins        "
                      "                                   "
                      "                                   "
                      """""""""""""""""""""""""""""""""""""
" Syntax checking on save"
let g:syntastic_tcl_checker='nagelfar'

" Javascript && CSS && HTML "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'phtml.vim'
Plugin 'othree/html5.vim'
Plugin 'HTML5-Syntax-File'
Plugin 'pangloss/vim-javascript'
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"
Plugin 'mattn/emmet-vim'
    let g:user_emmet_leader_key='<C-e>'
    " usage: <C-e>, Zen coding
    "        <C-e>n Jump to next editable place
Plugin 'jade.vim'
Plugin 'vim-stylus'
Plugin 'aaronj1335/underscore-templates.vim'
Plugin 'burnettk/vim-angular'

" Plugin 'Sass'

" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/neosnippet'
" Plugin 'Shougo/neosnippet-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Help:                                                                   "
"   :PluginList          - list configured bundles                        "
"   :PluginInstall(!)    - install(update) bundles                        "
"   :PluginSearch(!) foo - search(or refresh cache first) for foo         "
"   :PluginClean(!)      - confirm(or auto-approve) removal of            "
"                               unused bundles                            "
"                                                                         "
" See:  :h vundle for more details or wiki for FAQ                        "
" NOTE: comments after Bundle command are not allowed..                   "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                         "
"                                End Vundle                               "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start
set number
set ru

"colorscheme murphy
"colorscheme desert
"colorscheme slate
colorscheme molokai

set fileencodings=utf-8,cp936,latin1,ucs-bom
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

set ignorecase
set expandtab
set tabstop=4
set shiftwidth=4
"set autoindent
"set smartindent
"set cindent

"set textwidth=80
set linebreak
set backspace=2
set hlsearch
set incsearch
set showmatch

set list
set lcs+=space:·
set lcs+=tab:>-

"set mouse=a

set wmh=0

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

    filetype plugin on
    filetype indent on

    autocmd FileType h,c,cc,cpp,sh set ts=2 sw=2 cindent expandtab
    autocmd FileType js,javascript,html,scss,css,json,less set ts=2 sw=2 autoindent expandtab
    autocmd FileType php,python,phtml set ts=4 sw=4 autoindent expandtab
    autocmd FileType as,actionscript set ts=4 sw=4 expandtab autoindent smartindent
    autocmd FileType tcl compiler nagelfar
endif
