<<<<<<< HEAD
#这个是我的 Emacs 的配置文件

这个主要是从 [Steve Purcell](https://github.com/purcell/emacs.d) 的emacs的配置clone过来的,
做了一点点修改,方便我的使用.

```
git clone --recursive https://github.com/mut0u/emacs.d.git
```


##原来的配置所拥有的功能


##更改原配置的功能
1. 更改字体设置,增加中文字体.

##添加的新功能

1. 调整了快捷键的配置, 参考deepin-emacs的配置方法,将快捷键都配置在了init-key.el中. 目前还很初级,仅仅是把我常用的软件的快捷键更改了,需要持续维护.
2. 加入了init-org2blog.el 由于我的wordpress在wordpress.com上面,没有真正的使用过,需要进行验证.
3. 更改了init-common-lisp.el 我加入了 HyperSpec 文件, 可以使用w3m察看本地的帮助文档.
4. 加入了init-eim.el ,使用eim作为中文输入法
5. 加入autosave.el, 所有的文件修改都会自动保存.
6. 加入doc-view.el, 可以使用Emacs察看PDF文档.(因为这个功能是将PDF文件生成图片然后在显示出来,使用起来不是很顺手,只作为latex的一个察看方式)

##说明
我目前主要使用的是 common lisp, 因此别的东西并没有特别的配置,默认的配置已经相当好了.
=======
# A reasonable Emacs config

This is my emacs configuration tree, continually used and tweaked
since 2000, and it may be a good starting point for other Emacs
users, especially those who are web developers. These days it's
somewhat geared towards OS X, but it is known to also work on Linux
and Windows.

Emacs itself comes with support for many programming languages. This
config adds improved defaults and extended support for the following:

* Ruby / Ruby on Rails
* CSS / LESS / SASS / SCSS
* HAML / Markdown / Textile / ERB
* Clojure (via nrepl)
* Javascript / Coffeescript
* Python
* PHP
* Haskell
* Erlang
* Common Lisp (with Slime)

In particular, there's a nice config for *tab autocompletion*, and
flycheck is used to immediately highlight syntax errors in Ruby, HAML,
Python, Javascript, PHP and a number of other languages.

## Requirements

* Emacs 23 or greater (note that Emacs 24 is required for some
  functionality, and will likely become the minimum required version
  some time soon.)

## Installation

To install, clone this repo to `~/.emacs.d`, i.e. ensure that the
`init.el` contained in this repo ends up at `~/.emacs.d/init.el`:

```
git clone https://github.com/purcell/emacs.d.git ~/.emacs.d
```

Upon starting up Emacs for the first time, further third-party
packages will be automatically downloaded and installed.

## Updates

Update the config with `git pull`. You'll probably also want/need to update
the third-party packages regularly too:

<kbd>M-x package-list-packages</kbd>, then <kbd>U</kbd> followed by <kbd>x</kbd>.

## Adding your own customization

To add your own customization, use <kbd>M-x customize</kbd> and/or
create a file `~/.emacs.d/lisp/init-local.el` which looks like this:

```el
... your code here ...

(provide 'init-local)
```

Alternatively, fork the repo and hack away at the config to make it your own!

## Similar configs

You might also want to check out `emacs-starter-kit` and `emacs-prelude`.

## Support / issues

If you hit any problems, please [file an issue on the github project](https://github.com/purcell/emacs.d)

-Steve Purcell

<hr>

[![](http://api.coderwall.com/purcell/endorsecount.png)](http://coderwall.com/purcell)

[![](http://www.linkedin.com/img/webpromo/btn_liprofile_blue_80x15.png)](http://uk.linkedin.com/in/stevepurcell)
>>>>>>> purcell
