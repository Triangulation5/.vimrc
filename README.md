# vimrc

<!--toc:start-->
- [vimrc](#vimrc)
  - [Philosophy](#philosophy)
  - [Features](#features)
  - [Installation](#installation)
  - [Dependencies](#dependencies)
  - [License](#license)
<!--toc:end-->

<a href="http://ultravioletbat.deviantart.com/art/Yay-Evil-111710573">
  <img src="https://commons.wikimedia.org/wiki/File:OrbView-2_Satellite.jpg" align="right" />
</a>

> It begins with a simple desire: a text editor that starts instantly, works everywhere, and survives a fresh install. This is the result.

A single-file `.vimrc` built around native Vim functionality, sensible defaults, and long-term portability.

## Philosophy

* One file.
* No framework.
* No plugin dependency chain.
* Fast startup.
* SSH-friendly.
* Native Vim over ecosystem complexity.

## Features

* Relative line numbers
* Smart search defaults
* Ripgrep integration
* Persistent cursor restoration
* Built-in file browsing with netrw
* Simple leader-key workflow
* True-color terminal support

## Installation

```sh
git clone https://github.com/Triangulation5/.vimrc
cp vimrc ~/.vimrc
```

## Dependencies

Optional:

* `rg` (ripgrep) for project-wide searching
* `gruber-darker` or sometimes `vague` colorscheme (custom set colorscheme see the description of this commit hash `90dba6e`)

Everything else is built into Vim.

## License

MIT
