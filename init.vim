    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => Plugins
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set omnifunc=ale#completion#OmniFunc
	let g:ale_completion_enabled = 1
	let g:ale_completion_autoimport = 1
	let g:ale_sign_column_always = 1
	let g:ale_fix_on_save = 1
	let g:ale_sign_error = '✗'
	let g:ale_sign_warning = ''
	let g:ale_fixers = {
	\		'*': ['remove_trailing_lines', 'trim_whitespace'],
	\		'javascript': ['eslint'],
	\		'typescript': ['eslint','tslint', 'xo'],
	\		'css': ['stylelint', 'fecs'],
	\		'rust': ['rustfmt'],
	\		'python': ['black'],
	\}
	inoremap <silent><expr> <Tab>
				\ pumvisible() ? "\<C-n>" : "\<TAB>"

	let g:user_emmet_leader_key='<C-/>'

	let g:lightline = {
			\ 'colorscheme': 'iceberg',
			\ 'active': {
			\		'left': [ [ 'mode', 'paste' ],
			\							[ 'readonly', 'filename', 'modified' ] ]
			\ ,
			\		'right': [ [ 'lineinfo' ],
			\							 ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
			\							 [ 'percent' ],
			\							 [ 'fileformat', 'fileencoding', 'filetype' ] ]
			\ },
			\ 'component_function': {
			\		'filename': 'LightlineFilename',
			\ },
			\ 'component_expand': {
			\  'linter_checking': 'lightline#ale#checking',
			\  'linter_infos': 'lightline#ale#infos',
			\  'linter_warnings': 'lightline#ale#warnings',
			\  'linter_errors': 'lightline#ale#errors',
			\  'linter_ok': 'lightline#ale#ok',
			\ },
			\ 'component_type': {
			\			'linter_checking': 'right',
			\			'linter_infos': 'right',
			\			'linter_warnings': 'warning',
			\			'linter_errors': 'error',
			\			'linter_ok': 'right',
			\ }
	\ }
	let g:lightline#ale#indicator_checking = "\uf110"
	let g:lightline#ale#indicator_infos = "\uf129"
	let g:lightline#ale#indicator_warnings = "\uf071"
	let g:lightline#ale#indicator_errors = "\uf05e"
	let g:lightline#ale#indicator_ok = "\uf00c"
	let g:lightline.separator = {
			\		'left': '', 'right': ''
	\}
	let g:lightline.subseparator = {
			\		'left': '', 'right': ''
	\}
	function! LightlineFilename()
		return expand('%:t') !=# '' ? @% : '[No Name]'
	endfunction

	let g:fzf_layout = { 'down': '~10%' }

	call plug#begin('~/.local/share/nvim/plugged')
			Plug 'preservim/NERDTree'
			Plug 'cocopon/iceberg.vim'
			Plug 'cespare/vim-toml'
			Plug 'mattn/emmet-vim'
			Plug 'dense-analysis/ale'
			Plug 'itchyny/lightline.vim'
			Plug 'maximbaz/lightline-ale'
			Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
			Plug 'junegunn/fzf.vim'
	call plug#end()

	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => General
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set hidden
	set nohls
	set history=500
	filetype plugin indent on
	set autoread
	set laststatus=2
	set noshowmode
	au FocusGained,BufEnter * checktime

	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => VIM user interface
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set so=18
	set number relativenumber
	set wildmenu
	set ruler
	set cmdheight=1
	set hid
	set backspace=eol,start,indent
	set whichwrap+=<,>,h,l
	set ignorecase
	set smartcase
	set hlsearch
	set incsearch
	set lazyredraw
	set magic
	set showmatch
	set mat=1

	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => Colors and Fonts
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	syntax enable
	set background=dark
	colorscheme iceberg
	 set encoding=utf8
	set ffs=unix,dos,mac
	highlight Normal ctermbg=none
	highlight NonText ctermbg=none

	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => Files, backups and undo
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set nobackup
	set nowb
	set noswapfile

	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => Text, tab and indent related
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set noexpandtab
	set smarttab
	set shiftwidth=4
	set tabstop=4
	set lbr
	set tw=500
	set ai
	set si
	set wrap

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Python
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:ale_python_flake8_options = '-max-line-length=88'
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => Keybindigs
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	noremap <SPACE> <Nop>
	noremap <Up>		:10winc -<CR>
	noremap <Down>	:10winc +<CR>
	noremap <Left>	:10winc <<CR>
	noremap <Right> :10winc ><CR>

	let mapleader = " "

	nmap <C-k> :ALEPrev<CR>
	nmap <C-j> :ALENext<CR>
	nmap <silent> gd :ALEGoToDefinition -vsplit<CR>
	nmap <C-O> :NERDTree<CR>

	map <leader>s :Ag<space>
	map <silent> <leader><ESC> :noh<CR>
	map <C-k> <ESC>:ALEPrevious<CR>
	map <C-j> <ESC>:ALENext<CR>
	map <C-O> <ESC>:NERDTree<CR>

	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif"
