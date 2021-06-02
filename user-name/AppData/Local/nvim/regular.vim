" set shell=pwsh.exe

" Save file
nnoremap <Leader>ww :w<CR>
nnoremap <Leader>wa :wa<CR>
nnoremap <Leader>wq :wq<cr>

" Quit vim
inoremap <C-Q>     <esc>:q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>qq :q<cr>
nnoremap <Leader>qf :q!<cr>
nnoremap <Leader>qa :qa<cr>
nnoremap <Leader>qF :qa!<cr>

" TABS
" Move between windows in a tab
nmap <tab> <C-w>w
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l
" split windows
" split window bottom
" nnoremap <silent> <leader>th :split<CR>
" split window right
" nnoremap <silent> <leader>tv :vsp<CR>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>ts :tab split<cr>
nnoremap ,tc :tabclose<CR>

" RESIZE WINDOW
nnoremap <c-left> :vertical resize -2<CR>
nnoremap <c-right> :vertical resize +2<CR>
nnoremap <c-up> :resize +2<CR>
nnoremap <c-down> :resize -2<CR>

" QuickFix and Location list
nnoremap <leader>lc :lclose<CR>
nnoremap yoq :cclose<cr>

" create the new directory am already working in
nnoremap ,md :!mkdir -p %:h<cr><cr>
nnoremap ,rm :!trash-put %:p<cr>:bdelete!<cr>
" edit .bashrc file
nnoremap ,. :e ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1<CR>
nnoremap <leader>ee :Vexplore<CR>

" edit init.vim
nnoremap ,ec :e $MYVIMRC<CR>
" source init.vim
nnoremap ,sc :so $MYVIMRC<CR>
" source lua file
nnoremap ,sl :luafile %<CR>
" Check file in shellcheck
" nnoremap <leader>sc, :!clear && shellcheck -x %<CR>

" TO MOVE LINES up/down
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" TERMINAL
" start terminal in insert mode
autocmd TermOpen * startinsert
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <A-r> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
" exit insert mode
tnoremap <ESC><ESC> <C-\><C-n>
" launch terminal in new spit
nnoremap <leader>tt :tab split<cr> :term pwsh.exe<cr>
nnoremap <leader>tv :vsplit<cr> :term /usr/bin/fish<cr>

" COPY FILE PATH
" yank relative File path
nmap ,yr :let @+=expand("%")<CR>
" yank file name / not path
nmap ,yn :let @+=expand("%:t")<CR>
" yank file parent directory
nmap ,yd :let @+=expand("%:p:h")<CR>
" yank absolute File path
nmap ,yf :let @+=expand("%:p")<CR>
" copy relative path
nmap ,cr :let @"=expand("%")<CR>
" copy absolute path
nmap ,cf :let @"=expand("%:p")<CR>

" SEARCH AND REPLACE
" remove highlight from search term
nnoremap <leader>nh :noh<cr>
" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn
"find and replace in file
" press * {shift 8) to search for word under cursor and key combo below to
" replace in entire file
nnoremap <leader>rr :%s///g<left><left>
nnoremap <leader>rc :%s///gc<left><left><left>
" same as above but only visually selected range
xnoremap <leader>rr :%s///g<left><left>
xnoremap <leader>rc :%s///gc<left><left><left>
" : NOT VERY GOOD
" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>rR
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>rR
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" BUFFERS
" Delete all buffers
nnoremap <leader>ba :call DeleteAllBuffers('a')<cr>
" Delete empty buffers - not working
nnoremap <leader>be :call DeleteAllBuffers('e')<cr>
" Delete current buffer
nnoremap <leader>bd :bd%<cr>
" Delete current buffer force
nnoremap <leader>bD :bd!%<cr>
" Wipe current buffer
nnoremap <leader>bw :bw%<cr>
" go to buffer number - use like so gb34
nnoremap <leader>bl :ls<CR>:b
map <leader>bn :call RenameFile()<cr>

" COMPLETION
" <c-j> and <c-k> to navigate up and down
inoremap <expr> <C-j> pumvisible() ? "<C-n>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<C-p>" : "<C-k>"
" <cr> should behave like <c-y>: do not accept and place cursor on next line
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"
" right arrow also accepts suggestion
inoremap <expr> <right> pumvisible() ? "<C-y>" : "<right>"

"""""""""""""""""""""""""""""""""""""
" START FUGITIVE
"""""""""""""""""""""""""""""""""""""
" git status
nnoremap <leader>gg  :Git<CR>
nnoremap <leader>gc  :Git commit<CR>
" vertical split (3 way merge) to resolve git merge conflict
nnoremap <leader>gd  :Gvdiffsplit!<CR>
nnoremap <leader>g.  :Git add .<CR>
nnoremap <leader>g%  :Git add %<CR>
nnoremap <leader>gl  :Gllog!<CR>
nnoremap <leader>g0  :0Gllog!<CR>

nnoremap <leader>gr  :Git rebase -i HEAD~

nnoremap <leader>sp  :Git stash push -m ''<left>
nnoremap <leader>s%  :Git stash push -m '' -- %<left><left><left><left><left><left>
nnoremap <leader>sa  :Git stash apply stash@{}<left>
nnoremap <leader>sd  :Git stash drop stash@{}<left>
nnoremap <leader>sl  :Git stash list<CR>
nnoremap <leader>sc  :Git stash clear<CR>

nnoremap <leader>go  :Git push origin <right>
nnoremap <leader>gp  :Git push <right>
nnoremap <leader>gf  :Git push --force origin <right>
nnoremap <leader>ca :Git commit --amend<cr>
nnoremap <leader>ce :Git commit --amend --no-edit<cr>
nnoremap <leader>ct :Git commit --allow-empty -m ""<left>

" Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
"""""""""""""""""""""""""""""""""""""
" END fugitive
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" START FZF
"""""""""""""""""""""""""""""""""""""
" Search file from root directory
nnoremap <Leader>ff :Files!<CR>
" Search file from current directory
nnoremap <silent> <Leader>f. :Files! <C-r>=expand("%:h")<CR>/<CR>
" find open buffers
nnoremap <Leader>fb :Buffers!<CR>
" search buffers history
nnoremap <Leader>fh :History!<CR>
" search for text in current buffer
nnoremap <Leader>fl :BLines!<CR>
" search for text in loaded buffers
" nnoremap <Leader>L :Lines!<CR>
nnoremap <Leader>fm :Marks!<CR>
nnoremap <leader>ft :Filetypes!<CR>
nnoremap <leader>fw :Windows!<CR>
nnoremap <leader>fs :Colors!<CR>
" commands: user defined, plugin defined, or native commands
nnoremap <Leader>C :Commands!<CR>
" key mappings - find already mapped before defining new mappings
nnoremap <Leader>M :Maps!<CR>
" search in project - do not match filenames
nnoremap <Leader>/ :Rrg!<CR>

" Tags
" find symbols in current buffer (fzf-lsp.nvim)
nnoremap <leader>bt :DocumentSymbols!<CR>
" find tags in entire project directory (fzf-lsp.nvim)
nnoremap <leader>pt :WorkspaceSymbols!<CR>
nnoremap <leader>fa :CodeActions!<CR>
nnoremap <leader>fd :Diagnostics!<CR>

" GIT
" Files managed by git
nnoremap <Leader>fg :GFiles!<CR>
" Git commits
nnoremap <leader>cm :Commits!<CR>
" Git commits for the current buffer
nnoremap <leader>c% :BCommits!<CR>
" fzf-checkout
" find git branch:
" checkout = <CR>
" rebase = <C-r>
" delete = <C-d>
" merge = <C-e>
" track remote = <a-cr>
nnoremap <leader>cb :GBranches!<CR>

" search in project - match file names first
nnoremap ,/ :Rg!<CR>
" nnoremap <leader>sn :Snippets<CR>
" Vim’s :help documentation
nmap <Leader>H :Helptags!<CR>

" Advanced ripgrep integration
command! -bang -nargs=* Rrg
  \ call fzf#vim#grep(
  \   "rg --hidden --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}),
  \   <bang>0
  \ )

function! s:copy_fzf_results(lines)
  let joined_lines = join(a:lines, "\n")
  if len(a:lines) > 1
    let joined_lines .= "\n"
  endif
  let @+ = joined_lines
endfunction

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': function('s:copy_fzf_results'),
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ }

" scroll the fzf vim listing buffer
autocmd FileType fzf tnoremap <buffer> <C-j> <Down>
autocmd FileType fzf tnoremap <buffer> <C-k> <Up>
"""""""""""""""""""""""""""""""""""""
" END FZF
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" START NEOFORMAT
"""""""""""""""""""""""""""""""""""""
nnoremap <leader>fc :Neoformat<CR>
nnoremap <leader>N :Neoformat<CR>
"""""""""""""""""""""""""""""""""""""
" END NEOFORMAT
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" START LIGHTLINE
"""""""""""""""""""""""""""""""""""""
let g:lightline = {}

let g:lightline.component_function = {
  \'fugitive': 'LightlineFugitive',
  \ 'filename': 'LightlineFilename',
\}

let g:lightline.component = {
  \'filename': '%f',
\}

let g:lightline.active = {
  \'left': [
      \[
          \'mode',
          \'paste'
      \],
      \[
          \'fugitive',
          \'readonly',
          \'filename',
          \'modified',
      \]
  \],
\}

let g:lightline.tab_component_function = {
  \ 'filename_active': 'LightlineFilenameTab',
\}

let g:lightline.tab = {
  \ 'active': [
      \ 'tabnum',
      \ 'filename',
      \ 'modified'
  \],
  \ 'inactive': [
      \ 'tabnum',
      \ 'filename_active',
      \ 'modified'
  \],
\}

function! LightlineFugitive()
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return luaeval('require("util").get_file_name(2)')
endfunction

function! LightlineFilenameTab(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let filename = expand('#'.buflist[winnr - 1].':f')
  let sf = substitute(filename, '\', '/', 'g')
  let lua_func = 'require("util").get_file_name("' . sf . '")'
  return luaeval(lua_func)
endfunction
"""""""""""""""""""""""""""""""""""""
" END LIGHTLINE
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" START VIM-MAXIMIZER
"""""""""""""""""""""""""""""""""""""
let g:maximizer_set_default_mapping = 0

nnoremap mm :MaximizerToggle!<CR>
"""""""""""""""""""""""""""""""""""""
" END VIM-MAXIMIZER
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""
" START THEME
"""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized8
"""""""""""""""""""""""""""""""""""""
" END THEME
"""""""""""""""""""""""""""""""""""""

augroup MyMiscGroupRegular
  au!

  " Trim whitespace
  au BufWritePre * %s/\s\+$//e
  au BufWritePre * %s/\n\+\%$//e
  au BufWritePre *.[ch] *.[ch] %s/\%$/\r/e
  " autocmd FileType help wincmd H
  " autocmd! FileType json set filetype=jsonc
  autocmd! FileType vifm set filetype=vim
  au BufNewFile,BufRead *.html.django set filetype=htmldjango
  au BufNewFile,BufRead *.eslintrc set filetype=json
  au BufNewFile,BufRead *.code-snippets set filetype=json
  " au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set filetype=jinja
  au BufNewFile,BufRead .env* set filetype=sh
  au BufNewFile,BufRead *.psql set filetype=sql
  au BufNewFile,BufRead Dockerfile* set filetype=dockerfile
  au BufNewFile,BufRead *config set filetype=gitconfig
augroup END

" RENAME CURRENT FILE
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

" MANAGE BUFFERS
" https://tech.serhatteker.com/post/2020-06/how-to-delete-multiple-buffers-in-vim/
function! DeleteAllBuffers(f) abort
  let index = 1
  let last_b_num = bufnr("$")
  let normal_buffers = []
  let terminal_buffers = []
  let no_name_buffers = []

  while index <= last_b_num
    let b_name = bufname(index)
    if bufexists(index)
      if  (b_name == '' )
        call add(no_name_buffers, index)
      endif

      if a:f == 'a'
        if  (b_name =~ 'term://')
          call add(terminal_buffers, index)
        else
          call add(normal_buffers, index)
        endif
     endif
    endif
    let index += 1
  endwhile

  if len(no_name_buffers) > 0
    silent execute 'bwipeout! '.join(no_name_buffers)
  endif

  if len(terminal_buffers) > 0
    silent execute 'bwipeout! '.join(terminal_buffers)
  endif

  if len(normal_buffers) > 0
    silent execute 'bd ' .join(normal_buffers)
  endif
endfunction

" https://github.com/clarke/vim-renumber
function! Renumber() range
  let n=1

  " E486 Pattern not found
  for linenum in range(a:firstline, a:lastline)
    try
      " execute linenum . 's/\([\s\t])\d\+/' . n . '/'
      execute linenum . 's/^\([ 	]\+\)\?\([0-9]\+\)/\1' . n . '/'
      let n=n+1
    catch "Pattern not found"
      " Skipping lines that don't match our pattern
    endtry
  endfor
endfunction
