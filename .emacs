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

;; tabbar mode
(require 'tabbar)
(tabbar-mode t)
