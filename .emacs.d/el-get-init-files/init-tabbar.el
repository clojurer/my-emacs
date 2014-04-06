(tabbar-mode 1)
(global-set-key (kbd "C-M-'")    'tabbar-backward-group)  
(global-set-key (kbd "C-M-;")  'tabbar-forward-group)
(global-set-key (kbd "M-1") 'tabbar-backward-tab)
(global-set-key (kbd "M-2") 'tabbar-forward-tab) 

(setq  
 tabbar-scroll-left-help-function nil   ;don't show help information  
 tabbar-scroll-right-help-function nil  
 tabbar-help-on-tab-function nil  
 tabbar-home-help-function nil  
 tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button  
 tabbar-scroll-left-button (quote (("") ""))  
 tabbar-scroll-right-button (quote (("") "")))  
  
  
(defun my-tabbar-buffer-groups ()  
  "Return the list of group names the current buffer belongs to.  
Return a list of one element based on major mode."  
  (list  
   (cond  
    ((or (get-buffer-process (current-buffer))  
         ;; Check if the major mode derives from `comint-mode' or  
         ;; `compilation-mode'.  
         (tabbar-buffer-mode-derived-p  
          major-mode '(comint-mode compilation-mode)))  
     "Process"  
     )  
    ((string-equal "*" (substring (buffer-name) 0 1))  
     "Emacs Buffer"  
     )  
    ((eq major-mode 'dired-mode)  
     "Dired"  
     )  
    (t  
     "User Buffer"  
     ))))  
  
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)  
