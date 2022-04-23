let g:dirtytalk_blacklist = get(g:, 'dirtytalk_blacklist', [])

command! DirtytalkUpdate call dirtytalk#update()
