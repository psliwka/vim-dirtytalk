vim-dirtytalk: spellcheck dictionary for programmers 📖
=======================================================

This (neo)vim plugin is a dynamically updateable spellcheck dictionary, to be
used in conjunction with Vim's native spell checking feature. It is meant to
aid with writing technical documentation (such as project's READMEs, runbooks,
code comments, etc.), by providing you with a list of commonly used
programming-related words, to supplement Vim's built-in English word list. Does
your screen turn all red as soon as you `:set spell` on your project's README?
You might want to give _vim-dirtytalk_ a try!

Included word lists
-------------------

Currently the plugin comes bundled with following word lists, compiled into one
big list at installation time:

| List name | Example words |
|---|---|
| `acronyms` | API, JSON, PaaS |
| `algotihms` | quicksort, subtree, memoization |
| `brands` | GitHub, AdSense, DynamoDB |
| `comments` | TODO, FIXME, XXX |
| `cpp` | const, enum, lvalue |
| `docker` | Dockerfile, cgroups, ENTRYPOINT |
| `file-extensions` | .js, .yaml, .lua |
| `git` | submodule, worktree, rebase |
| `html` | h1, iframe, fieldset |
| `kubernetes` | ConfigMap, CSIDriver, HorizontalPodAutoscaler |
| `lorem-ipsum` | Lorem, ipsum, dolor |
| `nerd-fonts` |  ,  , &nbsp;| <!-- a non-breaking space is needed to render the last symbol correctly on GitHub -->
| `prometheus` | PromQL, Alertmanager, Pushgateway |
| `python` | docstring, iterable, awaitable |
| `unix` | SIGTERM, chroot, grep |
| `versions` | v1, v2, v3 |

You can disable lists you don't want to use. See the _customization_ section
for details.

Installation
------------

Install the plugin using your favorite plugin manager. Ensure that the
`:DirtytalkUpdate` command is executed after install and update. Example for
[vim-plug]:

```vim
Plug 'psliwka/vim-dirtytalk', { 'do': ':DirtytalkUpdate' }
```

Example for [packer.nvim]:

```lua
use {'psliwka/vim-dirtytalk', run = ':DirtytalkUpdate'}
```

Then include your freshly-compiled `programming` dictionary in your `spelllang`
setting. Example:

```vim
set spelllang=en,programming
```

Customization
-------------

To disable a word list, add it to `g:dirtytalk_blacklist` variable. Example:

```vim
let g:dirtytalk_blacklist=['lorem-ipsum']
```

Remember to re-run `:DirtytalkUpdate` after changing the blacklist.

Known issues
------------

* Nerd fonts symbols are marked as rare words, to exclude them from spell
	suggestions (`z=` and friends). This is needed, because otherwise their large
	amount grinds Vim's spell suggestions algorithm to a halt. As a side effect,
	all nerd fonts symbols are highlighted with `SpellRare` group (but at least
	not with `SpellBad`, as they would if they hadn't been included in the
	wordlist at all). If it bothers you, you can disable highlighting rare words
	entirely with `:highlight clear SpellRare` as a workaround.

Contributing
------------

You are encouraged to submit new word lists and other improvements to this
project. See [CONTRIBUTING](CONTRIBUTING.md) for details.

Credits
-------

Created by [Piotr Śliwka](https://github.com/psliwka).

Word lists were created by scraping various external sites and projects, listed
below:

* [Bjarne Stroustrup's homepage](https://www.stroustrup.com/)
* [BusyBox](https://www.busybox.net/)
* [Docker](https://docker.com)
* [GNU coreutils](https://www.gnu.org/software/coreutils/)
* [Kubernetes](https://kubernetes.io/)
* [MDN](https://developer.mozilla.org/)
* [Nerd Fonts](https://www.nerdfonts.com/)
* [Python](https://www.python.org/)
* [Simple Icons](https://simpleicons.org/)
* [The Open Group Base Specifications](https://pubs.opengroup.org/onlinepubs/9699919799/)
* [Wikipedia](https://en.wikipedia.org)
* [file-extension-list](https://github.com/dyne/file-extension-list)
* [vim-polyglot](https://github.com/sheerun/vim-polyglot)

Many thanks to authors and contributors of these!

License
-------

[MIT](LICENSE)

[vim-plug]: https://github.com/junegunn/vim-plug
[packer.nvim]: https://github.com/wbthomason/packer.nvim
