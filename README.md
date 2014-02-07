#这个是我的 Emacs 的配置文件

这个主要是从 [Steve Purcell](https://github.com/purcell/emacs.d) 的emacs的配置clone过来的,
做了一点点修改,方便我的使用.

git clone --recursive https://github.com/mut0u/emacs.d.git



##原来的配置所拥有的功能


##更改原配置的功能


##添加的新功能

1. 调整了快捷键的配置, 参考deepin-emacs的配置方法,将快捷键都配置在了init-key.el中. 目前还很初级,仅仅是把我常用的软件的快捷键更改了,需要持续维护.
2. 加入了init-org2blog.el 由于我的wordpress在wordpress.com上面,没有真正的使用过,需要进行验证.
3. 更改了init-common-lisp.el 我加入了 HyperSpec 文件, 可以使用w3m察看本地的帮助文档.
4. 加入了init-eim.el ,使用eim作为中文输入法
5. 加入autosave.el, 所有的文件修改都会自动保存.
6. 加入doc-view.el, 可以使用Emacs察看PDF文档.(因为这个功能是将PDF文件生成图片然后在显示出来,使用起来不是很顺手,只作为latex的一个察看方式)

##说明
我目前主要使用的是 common lisp, 因此别的东西并没有特别的配置,默认的配置已经相当好了.
