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
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(el-get 'sync)

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
 '(custom-safe-themes (quote ("9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default)))
 '(display-time-mode t)
 '(global-linum-mode t)
 '(lua-indent-level 4)
 '(scroll-bar-mode nil)
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
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; show path of the file in the title
(setq frame-title-format  
      '("%S" (buffer-file-name "%f"  
                   (dired-directory dired-directory "%b"))))

;; 注释代码
(global-set-key (kbd "C-c C-/")'comment-or-uncomment-region)

;; 翻页更加平滑
(setq scroll-margin 5 scroll-conservatively 10000)

;; rename a buffer
;;(global-set-key (kbd "C-c n") 'rename-buffer)

;; open a new shell
;;(global-set-key (kbd "C-c l") 'shell)

;; window move
(global-set-key (kbd "M-0") 'windmove-up)
(global-set-key (kbd "M-9") 'windmove-down)
(global-set-key (kbd "M-1") 'windmove-left)
(global-set-key (kbd "M-2") 'windmove-right)

;; enter to indent
(global-set-key (kbd "RET") 'newline-and-indent)

;; c-x o命令太长，回车已经可以取代c-j
;;(global-set-key (kbd "C-j") 'other-window)

;; 向前删一词
(global-set-key (kbd "C-j") 'backward-kill-word)

;; 跳转括号
(global-set-key (kbd "M-n") 'forward-list)
(global-set-key (kbd "M-p") 'backward-list)

(defvar emacs-english-font "Monaco"
  "The font name of English.")

(defvar emacs-cjk-font "Hiragino Sans GB W3"
  "The font name for CJK.")

(defvar emacs-font-size-pair '(15 . 18)
  "Default font size pair for (english . chinese)")

(defvar emacs-font-size-pair-list
  '(( 5 .  6) (10 . 12)
    (13 . 16) (15 . 18) (17 . 20)
    (19 . 22) (20 . 24) (21 . 26)
    (24 . 28) (26 . 32) (28 . 34)
    (30 . 36) (34 . 40) (36 . 44))
  "This list is used to store matching (englis . chinese) font-size.")

(defun font-exist-p (fontname)
  "Test if this font is exist or not."
  (if (or (not fontname) (string= fontname ""))
      nil
    (if (not (x-list-fonts fontname)) nil t)))

(defun set-font (english chinese size-pair)
  "Setup emacs English and Chinese font on x window-system."

  (if (font-exist-p english)
      (set-frame-font (format "%s:pixelsize=%d" english (car size-pair)) t))

  (if (font-exist-p chinese)
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset
                          (font-spec :family chinese :size (cdr size-pair))))))
(set-font emacs-english-font emacs-cjk-font emacs-font-size-pair)

(defun emacs-step-font-size (step)
  "Increase/Decrease emacs's font size."
  (let ((scale-steps emacs-font-size-pair-list))
    (if (< step 0) (setq scale-steps (reverse scale-steps)))
    (setq emacs-font-size-pair
          (or (cadr (member emacs-font-size-pair scale-steps))
              emacs-font-size-pair))
    (when emacs-font-size-pair
      (message "emacs font size set to %.1f" (car emacs-font-size-pair))
      (set-font emacs-english-font emacs-cjk-font emacs-font-size-pair))))

(defun increase-emacs-font-size ()
  "Decrease emacs's font-size acording emacs-font-size-pair-list."
  (interactive) (emacs-step-font-size 1))

(defun decrease-emacs-font-size ()
  "Increase emacs's font-size acording emacs-font-size-pair-list."
  (interactive) (emacs-step-font-size -1))

(global-set-key (kbd "C-=") 'increase-emacs-font-size)
(global-set-key (kbd "C--") 'decrease-emacs-font-size)

;; goto char
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char forward: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(defun wy-go-to-char-back (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char backward: ")
  (search-backward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-backward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(define-key global-map (kbd "C-c l") 'wy-go-to-char-back)
(define-key global-map (kbd "C-c k") 'wy-go-to-char)

;; monokai-theme
;;(require 'color-theme-monokai)
;;(load-theme 'monokai t)

(load "~/.emacs.d/themes/color-theme-molokai.el")
(color-theme-molokai)

;; 高亮当前行
(global-hl-line-mode 1)

;; desktop.el
(load "desktop") 
(desktop-load-default) 
(desktop-read)
