(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Loading theme misterioso
(load-theme 'wombat)



;; Seting up melpa repository
;;(require 'package)
;;(package-initialize)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/") t)

;; Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)


;; Add linum mode for programming
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'matlab-mode-hook 'linum-mode)
(add-hook 'LaTeX-mode-hook 'linum-mode)

;; Add Eletric Pair Mode for programming
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'matlab-mode-hook 'electric-pair-mode)
(add-hook 'LaTeX-mode-hook 'electric-pair-mode)



;; Define multiple cursor mode
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)



;; Add ido mode for faster auto completion
(require 'ido)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)

(ido-mode +1)



;; Add ido ubiquitous
(ido-ubiquitous-mode +1)

;; Add smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; Replace list buffers by ibuffer (a more powerfull tool to deal with buffers)
(global-set-key (kbd "C-x C-b") 'ibuffer)



;; Instal workgroups2 for emacs (a session manager)
;;(require 'workgroups2)
;;(workgroups-mode 1)



;; Install duplicate thing
(require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing)

;; Install volatille highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; Install undo tree
(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)

;; Install yasnippet
(require 'yasnippet)
(yas-global-mode 1)





;; Instal flycheck-tip
(require 'flycheck-tip)
(flycheck-tip-use-timer 'verbose)




;; Install Golden Ratio
(require 'golden-ratio)

(add-to-list 'golden-ratio-exclude-modes "ediff-mode")
(add-to-list 'golden-ratio-exclude-modes "helm-mode")
(add-to-list 'golden-ratio-exclude-modes "dired-mode")
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

(setq golden-ratio-exclude-modes '("ediff-mode"
                                   "gud-mode"
                                   "gdb-locals-mode"
                                   "gdb-registers-mode"
                                   "gdb-breakpoints-mode"
                                   "gdb-threads-mode"
                                   "gdb-frames-mode"
                                   "gdb-inferior-io-mode"
                                   "gud-mode"
                                   "gdb-inferior-io-mode"
                                   "gdb-disassembly-mode"
                                   "gdb-memory-mode"
                                   "magit-log-mode"
                                   "magit-reflog-mode"
                                   "magit-status-mode"
                                   "IELM"
                                   "eshell-mode" "dired-mode"))

(golden-ratio-mode)

;; Install irony mode (c++)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;; pyEnv mode
;(pyenv-mode)

;; Install anaconda mode (python)
;(add-hook 'python-mode-hook 'eldoc-mode)
;(add-hook 'python-mode-hook 'anaconda-mode)

;;  Install elpy-mode
(elpy-enable)
(elpy-use-ipython)


;; Install flycheck
(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Irony mode for fly check
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; Install company
(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

;; Add company-irony
(require 'company-irony)
(require 'company-irony-c-headers)
(require 'company-c-headers)
(require 'company-anaconda)

(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-c-headers company-irony-c-headers company-irony company-anaconda)))

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; Add company-auctex
;;(require 'company-auctex)
;;(company-auctex-init)


;; Add matlab mode
(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
(load-library "matlab-load")
(custom-set-variables
 '(matlab-shell-command-switches '("-nodesktop -nosplash")))


;; Backup files
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups



;; Markdown mode
(autoload 'markdown-mode "markdown-mode"
       "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; Ipython
(require 'ein)
(setq ein:use-auto-complete-superpack t)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
