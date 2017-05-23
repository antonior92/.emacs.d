
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(elpy-test-runner (quote elpy-test-discover-runner))
 '(inhibit-startup-screen t)
 '(matlab-shell-command-switches (quote ("-nodesktop -nosplash")))
 '(package-selected-packages
   (quote
    (pdf-tools ess company-math workgroups2 volatile-highlights undo-tree swiper speed-type smex python-mode pyenv-mode popwin pallet multiple-cursors markdown-mode magit julia-shell json-rpc jedi-direx ido-ubiquitous gscholar-bibtex golden-ratio ggtags flycheck-tip flycheck-irony expand-region exec-path-from-shell elpy el-spy ein-mumamo duplicate-thing company-jedi company-irony-c-headers company-irony company-c-headers company-auctex company-anaconda))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Loading theme wombat
(load-theme 'wombat)

;; Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; exec-path-from-shell
(require 'exec-path-from-shell) ;; if not using the ELPA package
(exec-path-from-shell-initialize)


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


;;  Install elpy-mode
(elpy-enable)
(setq elpy-rpc-backend "jedi")

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

;; Company math
(add-to-list 'company-backends 'company-math-symbols-unicode)

;; Add matlab mode
(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
(load-library "matlab-load")



;; Backup files
;;(setq
;;   backup-by-copying t      ; don't clobber symlinks
;;   backup-directory-alist
;;    '(("." . "~/.saves"))    ; don't litter my fs tree
;;   delete-old-versions t
;;   kept-new-versions 6
;;   kept-old-versions 2
;;   version-control t)       ; use versioned backups



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


;; Latex table of contents
(require 'tex-site)
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
;; (add-hook 'reftex-load-hook 'imenu-add-menubar-index)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq LaTeX-eqnarray-label "eq"
LaTeX-equation-label "eq"
LaTeX-figure-label "fig"
LaTeX-table-label "tab"
LaTeX-myChapter-label "chap"
TeX-auto-save t
TeX-newline-function 'reindent-then-newline-and-indent
TeX-parse-self t
TeX-style-path
'("style/" "auto/"
"/usr/share/emacs21/site-lisp/auctex/style/"
"/var/lib/auctex/emacs21/"
"/usr/local/share/emacs/site-lisp/auctex/style/")
LaTeX-section-hook
'(LaTeX-section-heading
LaTeX-section-title
LaTeX-section-toc
LaTeX-section-section
LaTeX-section-label))
(setq reftex-ref-macro-prompt nil)

;; key bindings
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; popwin
(require 'popwin)
(popwin-mode 1)
(push '("*Occur*" :width 0.3 :position right) popwin:special-display-config)
(push '("*compilation*" :width 0.3 :position right) popwin:special-display-config)


;; Julia Mode
(require 'julia-mode)
(require 'julia-shell)

(require 'ess-site)
(require 'ess-eldoc)
(setq inferior-julia-program-name "julia")
(setq ess-use-auto-complete t)
(setq ess-tab-complete-in-script t)


(setq ac-modes '(ess-julia-mode julia-mode inferior-ess-mode))

(require 'auto-complete)
(require 'auto-complete-config)
(setq ess-use-auto-complete 'script-only)
(define-key ac-completing-map (kbd "M-h") 'ac-quick-help)
(define-key ac-completing-map "\M-n" nil) ;; was ac-next
(define-key ac-completing-map "\M-p" nil) ;; was ac-previous
(define-key ac-completing-map "\M-," 'ac-next)
(define-key ac-completing-map "\M-k" 'ac-previous)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map [tab] 'ac-complete)
(define-key ac-completing-map [return] nil)

(ac-config-default)

;; pdf-tools
(pdf-tools-install)

;; to use pdfview with auctex
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t) ;; not sure if last line is neccessary

;; to have the buffer refresh after compilation
(add-hook 'TeX-after-compilation-finished-functions
	  #'TeX-revert-document-buffer)
