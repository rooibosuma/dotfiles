"フリーズ対策
if has('unix')
	set nofsync
	set swapsync=
endif
"view-------------------------------
syntax on
set background=dark
set number
set showmode
set title
set showcmd
set showmatch
set laststatus=2
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]
hi StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white
set notitle
"backup--------------------------
"set backupdir=$HOME/unix/vim/bak
"set directory=$HOME/unix/vim/swp
set nobackup
"bind---------------------------
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nmap 8 :e ++enc=utf8<ENTER>
nmap 2 :e ++enc=iso-2022-jp<ENTER>
"nnoremap - mxgg=G`x
"generaru----------------
filetype on
filetype indent plugin on
set nocompatible
set wildmode=list,full
set autoindent smartindent
set hidden
set browsedir=buffer
set shiftwidth=4
set smarttab
set tabstop=4
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
"自動コメントなし
"set formatoptions-=ro
autocmd FileType *  setlocal formatoptions-=ro
"set autochdir
"Hokan-----------------------------
"<C-Space>でomni補完
imap <C-Space> <C-x><C-o>
"search------------------------------
set ignorecase
set smartcase
set nowrapscan
set noincsearch
set hlsearch
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz 
noremap <Space>n :bnext<CR>
noremap <Space>p :bnext<CR>
noremap <Space>d :bd<CR>
"連番縦
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
"auto set---------------------
au BufNewFile,BufRead * set iminsert=0
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4
".txtファイルで自動的に日本語入力ON
au BufNewFile,BufRead *.txt set iminsert=2
".rhtmlと.rbでタブ幅を変更
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2
"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" enc, fenc
command! -bang -nargs=? Utf8Edit  edit<bang> ++enc=utf-8 <args>
command! -bang -nargs=? EucjpEdit edit<bang> ++enc=euc-jp <args>
command! -bang -nargs=? SjisEdit  edit<bang> ++enc=sjis <args>
command! -bang -nargs=? Cp932Edit edit<bang> ++enc=cp932 <args>
command! -nargs=0 Utf8Set  setlocal fenc=utf-8
command! -nargs=0 EucjpSet setlocal fenc=euc-jp
command! -nargs=0 SjisSet  setlocal fenc=sjis
nnoremap <Leader>eu :<C-u>Utf8Edit<CR>
nnoremap <Leader>ee :<C-u>EucjpEdit<CR>
nnoremap <Leader>es :<C-u>SjisEdit<CR>
nnoremap <Leader>ec :<C-u>Cp932Edit<CR>
nnoremap <Leader>su :<C-u>Utf8Set<CR>
nnoremap <Leader>se :<C-u>EucjpSet<CR>
nnoremap <Leader>ss :<C-u>SjisSet<CR>


"Plugins------------------------------
"yanktmp
let g:yanktmp_file = '/tmp/example_tmp_file'

"fuzzyfinde----
"noremap <Space>b :FuzzyFinderBuffer<CR>
"noremap <Space>f :FuzzyFinderFile<CR>
"noremap <Space>H :FuzzyFinderMruFile<CR>
"qbuf---
let g:qb_hotkey = "<Space><Space>"

"MRU----
:let MRU_Max_Entries=20
noremap <Space>h :MRU<CR>
"yankring----
let g:yankring_history_dir = '$HOME/.tmp/'
let g:yankring_max_history = 200
let g:yankring_max_display = 200
let g:yankring_window_use_separate = 1
let g:yankring_window_height = 14
nnoremap <Space>y :YRShow<CR>
command! -nargs=1 Y YRSearch <args>
"rails.vim----
let g:rails_level = 4
let g:rails_url='http://localhost:56789'
"let g:rails_devalut_database = 'mysql'

"LDR----
let g:fastladder_server = 'http://reader.livedoor.com'

"Ack----
let g:AckCmd = '~/bin/ack'
"toggle quickfixwindow
"http://d.hatena.ne.jp/kuhukuhun/20090119/1232343733
function! s:toggle_quickfix_window()
	let _ = winnr('$')
	cclose
	if _ == winnr('$')
		cwindow
	endif
endfunction
nnoremap <silent> <Space>q :<C-u>call <SID>toggle_quickfix_window()<CR>

"gist----
let g:github_user = 'user_name'
let g:github_token = 'user_token'


"sign-diff----
"nnoremap <C-l>  :SDUpdate<CR><C-l>

" ku.vim-
"nnoremap [ku] <Nop>
"nmap <Space>k [ku]
nnoremap <silent> <Space>kf :<C-u>Ku file<CR>
nnoremap <silent> <Space>kb :<C-u>Ku buffer<CR>
"nnoremap <silent> <Space>kh :<C-u>Ku file_mru<CR>
"nnoremap <silent> <Space>cm :<C-u>Ku cmd_mru/cmd<CR>
"nnoremap <silent> <Space>sm :<C-u>Ku cmd_mru/search<CR>
"nnoremap <silent> <Space>ku :<C-u>Ku source<CR>
let g:ku_file_mru_limit = 500

" surround.vim--------------
" ysiw(command) word
" yss(command)  line
" S auto indent
let g:surround_{char2nr("-")} = "<% \r %>"
let g:surround_{char2nr("=")} = "<%= \r %>"

" --------------------------------

" quickrun.vim
silent! nmap <unique> <Space>r <Plug>(quickrun)

"-----------------------------------------------------------------

" encoding
" http://www.kawaz.jp/pukiwiki/?vim#cb691f26

if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
endif
if has('iconv')
	let s:enc_euc = 'euc-jp'
	let s:enc_jis = 'iso-2022-jp'
	" iconvがeucJP-msに対応しているかをチェック
	if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'eucjp-ms'
		let s:enc_jis = 'iso-2022-jp-3'
		" iconvがJISX0213に対応しているかをチェック
	elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'euc-jisx0213'
		let s:enc_jis = 'iso-2022-jp-3'
	endif
	" fileencodingsを構築
	if &encoding ==# 'utf-8'
		let s:fileencodings_default = &fileencodings
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
		let &fileencodings = &fileencodings .','. s:fileencodings_default
		unlet s:fileencodings_default
	else
		let &fileencodings = &fileencodings .','. s:enc_jis
		set fileencodings+=utf-8,ucs-2le,ucs-2
		if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
			set fileencodings+=cp932
			set fileencodings-=euc-jp
			set fileencodings-=euc-jisx0213
			set fileencodings-=eucjp-ms
			let &encoding = s:enc_euc
			let &fileencoding = s:enc_euc
		else
			let &fileencodings = &fileencodings .','. s:enc_euc
		endif
	endif

" 定数を処分
unlet s:enc_euc
unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
	function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
	endfunction
	autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
	set ambiwidth=double
endif


