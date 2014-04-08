my-emacs
========

Replicating a package set on another Emacs installation

In the Emacs whose setup you wish to replicate, type M-x ielm for an Emacs Lisp prompt, and enter:

`(setq my-packages
              ',(mapcar #'el-get-as-symbol
                        (el-get-list-package-names-with-status "installed")))

Copy the result into the new Emacs, in which you should already have installed El-Get, and evaluate it, followed by (el-get 'sync my-packages)
