" OSごとに設定を場合分け
let OSTYPE = system('uname')

if OSTYPE == "Darwin\n"
   "Mac向けの設定


elseif OSTYPE == "Linux\n"
   "ここにLinux向けの設定
endif

"Vi互換をオフ
set nocompatible
filetype off

" 一旦offにして後でonにする
filetype plugin indent off

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif


let s:cache_home = expand('~/.cache')
let s:config_home = expand('~/.config')


" dein settings {{{
" https://qiita.com/kawaz/items/ee725f6214f91337b42b
" dein自体の自動インストール
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
" let s:toml_file = g:rc_dir.'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}





" " easymotionの設定
" " ホームポジションに近いキーを使う
" " let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB' 
" let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvb' 
" " 「'」 + 何かにマッピング
" let g:EasyMotion_leader_key="'" 
" " 1 ストローク選択を優先する 
" let g:EasyMotion_grouping=1
" " カラー設定変更
" hi EasyMotionTarget ctermbg=none ctermfg=red " 
" hi EasyMotionShade  ctermbg=none ctermfg=blue

syntax on


" .texファイルの記号を変換して表示しない
let g:tex_conceal=''

" leaderをスペースキーにする
let mapleader = "\<Space>"

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
 
set autoindent
"バックアップファイルを作るディレクトリ
" set backupdir=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをWindowsと連携
set clipboard=unnamed
"スワップファイル用のディレクトリ
" set directory=$HOME/vimbackup
"undoの設定
set undofile
"タブの代わりに空白文字を挿入する
set expandtab
"タブを表示するときの幅"
set tabstop=4
"タブを挿入するときの幅"
set shiftwidth=4
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"検索マッチテキストをハイライト
set hlsearch
"バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
"折り返しでインデントを保持
set breakindent
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:↲,tab:>\ ,extends:<
"行番号を表示する
" set relativenumber
set number
"シフト移動幅
"set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"大文字小文字を区別しない
set ignorecase
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"補完時に大文字小文字を区別しない
set infercase
"カーソルを文字が存在しない部分でも動けるようにする
set virtualedit=all
"行を強調表示
set nocursorline
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
"set tabstop=4
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
"テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"ルーラーを表示 (noruler:非表示)
set ruler
"長い行を折り返して表示 (nowrap:折り返さない)
set wrap
"80文字目にラインを入れる
"set colorcolumn=80
"常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
"コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
"コマンドをステータス行に表示
set showcmd
"タイトルを表示
set title
"helpの言語をデフォルトで日本語にする。キーワードの後に@enをつけると英語になる
set helplang& helplang=ja,en
" コマンドラインでの補完候補を表示する
set wildmenu

" 行番号を相対表示にする。
" 参照：http://cohama.hateblo.jp/entry/2013/10/07/020453
set rnu

" カーソル位置記憶
" https://qiita.com/rouge_pawn/items/342607bb26894cea9767
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif

"pythonコードでdocstringは表示しない
"参照：http://dackdive.hateblo.jp/entry/2014/08/13/130000
"autocmd FileType python setlocal completeopt-=preview

"入力モード中に素早くjjと入力した場合はESCとみなす
" inoremap jj <Esc>
"j,k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
"Ctrl+[h,j,k,l]でウィンドウ間の移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
inoremap <C-k> <C-o>D

"マウスを使えるようにする
set mouse=a
set guioptions+=a
"set ttymouse=xterm2

"コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
" if !has('gui_running') && has('xterm_clipboard')
"   set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
" endif

"ヤンクした文字は、システムのクリップボードに入れる
set clipboard+=unnamed

" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0


" \cで行の先頭にコメントをつけたり外したりできる
" 参照：http://ichyo.jp/posts/2014-03-1-4how-to-comment-out-with-vim/
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

" \rでquickrun
"nnoremap <Leader>R <Plug>(Quickrun)
"let g:quickrun_config = {}
"let g:quickrun_config['*'] = {'runner': 'vimproc'}
"" MarkdownファイルでQuickRunを起動した時に、出力をブラウザに向ける
"" 参考：http://vim-jp.org/vim-users-jp/2011/09/15/Hack-230.html
"let g:quickrun_config['markdown'] = {
"            \ 'type': 'markdown/pandoc',
"            \ 'outputter': 'browser',
"            \ 'cmdopt': '-s --mathjax -c ~/.pandoc/github.css'
"            \ }


" Unite
" 参照：http://qiita.com/hide/items/77b9c1b0f29577d60397
" let g:unite_enable_start_insert=1
"let g:unite_source_history_yank_enable =1
"let g:unite_source_file_mru_limit = 200
"nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
"nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
"nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
"nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" vim-table-modeの設定
"let g:table_mode_corner_corner="+"
"let g:table_mode_header_fillchar="="
"
"
filetype plugin indent on

