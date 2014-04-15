;; el-get
(setq el-get-user-package-directory  "~/.emacs.d/el-get-init-files/")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)
;; tool-bar
(tool-bar-mode -1)

;;禁用启动画面
(setq inhibit-startup-message t)

;; set mark
(global-set-key (kbd "C-z") 'set-mark-command)

;;设置删除纪录
(setq kill-ring-max 200)

;;语法加亮
(global-font-lock-mode t)

;;高亮显示成对括号，但不来回弹跳
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;粘贴在光标处，而不是鼠标指针处
(setq mouse-yank-at-point t)

;;使用 y or n 提问
(fset 'yes-or-no-p 'y-or-n-p)

;;显示时间
(display-time)
;;时间格式
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)

;;显示列号
(setq column-number-mode t)

;;空格缩进
(setq-default indent-tabs-mode nil)

;; buffer-menu
(global-set-key (kbd "C-c m") 'buffer-menu)

;; 光标不要闪烁
(blink-cursor-mode -1)

;; 默认gc分配20MB
(setq gc-cons-threshold 20000000)

;; tabbar mode
(require 'tabbar)
(tabbar-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-time-mode t)
 '(lua-indent-level 4)
 '(session-use-package t nil (session))
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; kill-line的时候kill整个line，包括最后的回车
(setq kill-whole-line t)

;; 我讨厌波浪号后缀的文件
(setq backup-by-copying t)  ; 备份文件
(setq backup-directory-alist '(("." . "~/.emacs_saved_file")))  ;设置备份目录
(setq delete-old-versions nil)  ; 删除旧的备份文件，这里取决于有没有开启 version-control
(setq version-control t)  ; 不用单文件来备份，采用数字计数的方式
(setq kept-new-versions 5)  ; 新的文件备份最多能保存几个
(setq kept-old-versions 2)  ; 旧文件最多能保存几个
(setq delete-old-versions t)  ; 在新的或是旧的文件中超过了上面的数字，不需要询问就直接删除多余的。

;; enable ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-c m") 'ibuffer)

;; desktop.el
(load "desktop") 
(desktop-load-default) 
(desktop-read)

;; 去掉滚动条
(scroll-bar-mode nil)

;; show path of the file in the title
(setq frame-title-format  
      '("%S" (buffer-file-name "%f"  
                   (dired-directory dired-directory "%b"))))

;; 注释代码
(global-set-key (kbd "C-c C-/")'comment-or-uncomment-region)

;; 翻页更加平滑
(setq scroll-margin 3 scroll-conservatively 10000)

;; rename a buffer
(global-set-key (kbd "C-c n") 'rename-buffer)

;; open a new shell
(global-set-key (kbd "C-c l") 'shell)

;; window move
(global-set-key (kbd "M-0") 'windmove-up)
(global-set-key (kbd "M-9") 'windmove-down)
(global-set-key (kbd "M-1") 'windmove-left)
(global-set-key (kbd "M-2") 'windmove-right)
