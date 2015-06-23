(require 'package)                      
(push '("melpa" . "http://melpa.milkbox.net/packages/")
    package-archives)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e56f1b1c1daec5dbddc50abd00fcd00f6ce4079f4a7f66052cf16d96412a09a9" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "ab3e4108e9b6d9b548cffe3c848997570204625adacef60cbd50a39306866db1" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(package-initialize)
(load-theme 'leuven t)

(require 'evil)
(evil-mode 1)

(evil-commentary-default-setup)

(tool-bar-mode -1)
(menu-bar-mode -1)

(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
(global-set-key (kbd "M-h") 'evil-window-left)
(global-set-key (kbd "M-l") 'evil-window-right)
(global-set-key (kbd "M-j") 'evil-window-down)
(global-set-key (kbd "M-k") 'evil-window-up)

(global-set-key (kbd "M-n") 'next-buffer)
(global-set-key (kbd "M-p") 'previous-buffer)

(scroll-bar-mode -1)
(menu-bar-mode -1)

(global-linum-mode t)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(global-hl-line-mode 1)
(require 'ido)
(ido-mode t)
(set-default-font "Source Code Pro for Powerline 10")
(setq-default truncate-lines t)
(global-font-lock-mode -1) 

(sml/setup)
(sml/apply-theme 'light)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "x" 'execute-extended-command
  "k" 'kill-buffer
  "q" 'delete-window
  "p" 'clipboard-yank
  "w"  'evil-write)

(setq menu-prompting nil)
(setq-default indent-tabs-mode nil)
(require 'whitespace)
