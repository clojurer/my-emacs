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

;;set mark
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
(setq display-time-interval 30)

;;显示列号
(setq column-number-mode t)

;;空格缩进
(setq-default indent-tabs-mode nil)

;; 默认gc分配20MB
(setq gc-cons-threshold 20000000)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments (quote ("--smart-case" "--nogroup" "--column" "--all-text")))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "943bff6eada8e1796f8192a7124c1129d6ff9fbd1a0aed7b57ad2bf14201fdd4" "9a9e75c15d4017c81a2fe7f83af304ff52acfadd7dde3cb57595919ef2e8d736" "9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "f41fd682a3cd1e16796068a2ca96e82cfd274e58b978156da0acce4d56f2b0d5" "978ff9496928cc94639cb1084004bf64235c5c7fb0cfbcc38a3871eb95fa88f6" "51bea7765ddaee2aac2983fac8099ec7d62dff47b708aa3595ad29899e9e9e44" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "405fda54905200f202dd2e6ccbf94c1b7cc1312671894bc8eca7e6ec9e8a41a2" "9bac44c2b4dfbb723906b8c491ec06801feb57aa60448d047dbfdbd1a8650897" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" default)))
 '(display-time-mode t)
 '(lua-indent-level 4)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 备份
;; (setq auto-save-file-name-transforms `((".*" "~/.emacs_auto_save_file" t)))
(setq backup-by-copying t)  ; 备份文件
(setq backup-directory-alist '(("." . "~/.emacs_backup_file")))  ;设置备份目录
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
(setq scroll-margin 2 scroll-conservatively 10000)

;; window move 使用switch-window可以更高效代替
(global-set-key (kbd "C-c w k") 'windmove-up)
(global-set-key (kbd "C-c w j") 'windmove-down)
(global-set-key (kbd "C-c w h") 'windmove-left)
(global-set-key (kbd "C-c w l") 'windmove-right)

;; enter to indent
(global-set-key (kbd "RET") 'newline-and-indent)

;; 向前删一词
(global-set-key (kbd "C-j") 'backward-kill-word)

;; 字体（只能在UI下用，nw模式下要注释这段代码）
;; (defvar emacs-english-font "Monaco"
;;   "The font name of English.")

;; (defvar emacs-cjk-font "Hiragino Sans GB W3"
;;   "The font name for CJK.")

;; (defvar emacs-font-size-pair '(15 . 18)
;;   "Default font size pair for (english . chinese)")

;; (defvar emacs-font-size-pair-list
;;   '(( 5 .  6) (10 . 12)
;;     (13 . 16) (15 . 18) (17 . 20)
;;     (19 . 22) (20 . 24) (21 . 26)
;;     (24 . 28) (26 . 32) (28 . 34)
;;     (30 . 36) (34 . 40) (36 . 44))
;;   "This list is used to store matching (englis . chinese) font-size.")

;; (defun font-exist-p (fontname)
;;   "Test if this font is exist or not."
;;   (if (or (not fontname) (string= fontname ""))
;;       nil
;;     (if (not (x-list-fonts fontname)) nil t)))

;; (defun set-font (english chinese size-pair)
;;   "Setup emacs English and Chinese font on x window-system."

;;   (if (font-exist-p english)
;;       (set-frame-font (format "%s:pixelsize=%d" english (car size-pair)) t))

;;   (if (font-exist-p chinese)
;;       (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;         (set-fontset-font (frame-parameter nil 'font) charset
;;                           (font-spec :family chinese :size (cdr size-pair))))))
;; (set-font emacs-english-font emacs-cjk-font emacs-font-size-pair)

;; (defun emacs-step-font-size (step)
;;   "Increase/Decrease emacs's font size."
;;   (let ((scale-steps emacs-font-size-pair-list))
;;     (if (< step 0) (setq scale-steps (reverse scale-steps)))
;;     (setq emacs-font-size-pair
;;           (or (cadr (member emacs-font-size-pair scale-steps))
;;               emacs-font-size-pair))
;;     (when emacs-font-size-pair
;;       (message "emacs font size set to %.1f" (car emacs-font-size-pair))
;;       (set-font emacs-english-font emacs-cjk-font emacs-font-size-pair))))

;; (defun increase-emacs-font-size ()
;;   "Decrease emacs's font-size acording emacs-font-size-pair-list."
;;   (interactive) (emacs-step-font-size 1))

;; (defun decrease-emacs-font-size ()
;;   "Increase emacs's font-size acording emacs-font-size-pair-list."
;;   (interactive) (emacs-step-font-size -1))

;; (global-set-key (kbd "C-<right>") 'increase-emacs-font-size)
;; (global-set-key (kbd "C-<left>") 'decrease-emacs-font-size)
;; 字体（只能在UI下用，nw模式下要注释这段代码）

(global-set-key (kbd "C-c C-n") 'end-of-defun)
(global-set-key (kbd "C-c C-p") 'beginning-of-defun)

(defun set-current-bookmark ()
  (interactive)
  (progn
    (bookmark-set "current-place")
    (message "set bookmark at current point")))

(defun go-to-last-bookmark ()
  (interactive)
  (bookmark-jump "current-place"))

(global-set-key (kbd "C-c m") 'set-current-bookmark)
(global-set-key (kbd "C-c j") 'go-to-last-bookmark)

(load "~/.emacs.d/themes/color-theme-molokai.el")
(color-theme-molokai)

;; Smart copy, if no region active, it simply copy the current whole line
(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode js-mode
                                latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))
 
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
                 (message "Copied line")
                 (list (line-beginning-position)
                       (line-beginning-position 2)))))
 
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
 
;; Copy line from point to the end, exclude the line break
(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
                  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
 
(global-set-key (kbd "M-k") 'qiang-copy-line)


(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
