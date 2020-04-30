" Author: mna <https://github.com/mna>
" Description: Support for vala-language-server

function! ale_linters#vala#valals#GetProjectRoot(buffer) abort
    let l:project_root = ale#path#FindNearestDirectory(a:buffer, '.git')

    if !empty(l:project_root)
        return fnamemodify(l:project_root, ':h:h')
    endif

    return ''
endfunction

function! ale_linters#vala#valals#GetCommand(buffer) abort
    return '%e'
endfunction

call ale#linter#Define('vala', {
\   'name': 'valals',
\   'lsp': 'stdio',
\   'executable': 'vala-language-server',
\   'command': function('ale_linters#vala#valals#GetCommand'),
\   'language': 'vala',
\   'project_root': function('ale_linters#vala#valals#GetProjectRoot'),
\})
