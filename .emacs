(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-hl-line-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (ido-mode 1)
(setq-default tab-width 2)
(set-default-font "SF Mono-12")
;; (set-default-font "Iosevka Medium-12")
;;(set-default-font "Iosevka-12")
;; (set-default-font "Menlo-12")
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq-default indent-tabs-mode nil)
(set-fringe-mode 0)
;; (load-theme 'gruvbox t)
;; (load-theme 'atom-one-dark t)

;; Disable backup files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1)
  ;; (setq projectile-project-search-path '("~/project" "~/hijup/new-k8s-cluster/mono" "~/hijup/new-k8s-cluster/deployment"))
  (setq projectile-completion-system 'ivy)
  )

(use-package counsel
  :ensure t
  :config (counsel-mode 1))

;; https://github.com/ericdanan/counsel-projectile
(use-package counsel-projectile
  :ensure t
  :config (counsel-projectile-mode))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-nerd-commenter
  :ensure t)

(use-package linum-relative
  :ensure t
  :config
  (setq linum-relative-backend 'display-line-numbers-mode)
  (linum-relative-global-mode))

; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))
  
;; General remap sortcut
 (use-package general
  :ensure t
  :config (general-define-key
;;  :states '(normal visual insert emacs)
  :keymaps '(normal visual emacs motion)
  :prefix "SPC"
  :non-normal-prefix "C-SPC"
  "" nil ;;https://github.com/noctuid/general.el/issues/54#issuecomment-302673526
  "/"   '(counsel-rg :which-key "ripgrep") ; You'll need counsel package for this
  "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
  "SPC" '(counsel-M-x :which-key "M-x")
  ;; "SPC" '(execute-extended-command :which-key "M-x")

  ;; File
  "ff"  '(counsel-find-file :which-key "find files")
  ;; "ff"  '(find-file :which-key "find file")

  ;; Buffers
  ;; "bb"  '(switch-to-buffer :which-key "switch to buffer")
  "bb"  '(ivy-switch-buffer :which-key "switch to buffer")
  "bl"  '(list-buffers-and-focus :which-key "list buffers and focus")
  "bp"  '(previous-buffer :which-key "switch to buffer")
  "bn"  '(next-buffer :which-key "switch to buffer")
  "bN"  '(evil-buffer-new :which-key "new buffer")
  "bo"  '(switch-to-buffer-other-window :which-key "switch to buffer other window")
  "bk"  '(kill-buffer :which-key "kill-buffer")

  ;; Window
  "wl"  '(windmove-right :which-key "move right")
  "wh"  '(windmove-left :which-key "move left")
  "wk"  '(windmove-up :which-key "move up")
  "wj"  '(windmove-down :which-key "move bottom")
  "w%"  '(split-window-right :which-key "split right")
  "w;"  '(split-window-below :which-key "split bottom")
  "wk"  '(delete-window :which-key "delete window")

  ;; Nerd commented
  "ci" 'evilnc-comment-or-uncomment-lines ;; comment 3 line 3-SPC-ci
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cr" 'comment-or-uncomment-region

  ;; Fzf
  "sf" '(counsel-fzf :which-key "search file fzf")
  ;; "sf" '(fzf :which-key "search file fzf")

  ;; Ag
  "ag" '(counsel-ag :which-key "search ag")

  ;; Projectile
  "pp" 'projectile-switch-project
  "pb" 'projectile-switch-to-buffer
  "pa" 'projectile-add-known-project

  ;; Others
  ;;"at"  '(ansi-term :which-key "open terminal")
  )
  (general-define-key
   :states 'normal
   :keymaps 'emacs-lisp-mode-map
           :prefix "SPC"
           "e" '(eval-last-sexp :which-key "eval last elips expression"))

  ;; lsp-mode -> go-mode
  (general-define-key
   :states 'normal
   :keymaps 'go-mode-map
   "gd" '(lsp-find-definition :which-key "go-mode to definition")
   "gi" '(lsp-organize-imports :which-key "go-mode organize imports")
   "gta" '(go-tag-add :which-key "go-mode add tag")
   "gtr" '(go-tag-remove :which-key "go-mode remove tag"))

  ;; org-mode
  (general-define-key
   :states 'normal
   :keymaps 'org-mode-map
   :prefix "SPC"
   "oi" '(org-clock-in :which-key "org clock in")
   "oo" '(org-clock-out :which-key "org clock out")
   "od" '(org-clock-display :which-key "org clock display")

  (general-define-key
   :keymaps '(normal insert)
   :prefix ","
   "f" '(counsel-fzf :which-key "FZF")
   "a" '(counsel-rg :which-key "riprep")))

  ;; ruby-mode
  ;; before install ctags, macos https://gist.githubusercontent.com/alexshgov/7e5ed7841667c66ef5ca4f31664714a9/raw/726a5b2eaef5d192f2a9f49d896f541355d6067e/install-universal-ctags-with-gtags-osx.md
  (general-define-key
   :states 'normal
   :keymaps 'ruby-mode-map
   "gd" '(xref-find-definitions :which key "ruby-mode xref find definitions")))

(use-package lsp-mode
  :hook (go-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :config (setq lsp-enable-snippet t))
(use-package lsp-ui :commands lsp-ui-mode :config (setq lsp-prefer-flymake nil))
;; https://emacs.stackexchange.com/questions/17965/company-mode-popup-closes-after-c-n
(use-package company-lsp :commands company-lsp
  :bind (:map company-active-map
              ("C-n" . company-select-next-or-abort)
              ("C-p" . company-select-previous-or-abort)))

(use-package go-tag)
(use-package yasnippet
  :ensure t
  :config
  ;; (yas-global-mode 1))
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode))

(use-package doom-snippets
  :load-path "~/.emacs.d/snippets/doom-snippets"
  :after yasnippet)

;; Custom script
(defun list-buffers-and-focus (&optional arg)
  (interactive "P")
  (list-buffers)
  (other-window 1))

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one-light t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a94f1a015878c5f00afab321e4fef124b2fc3b823c8ddd89d360d710fc2bddfc" "8d5f22f7dfd3b2e4fc2f2da46ee71065a9474d0ac726b98f647bc3c7e39f2819" "73a13a70fd111a6cd47f3d4be2260b1e4b717dbf635a9caee6442c949fad41cd" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" "5f27195e3f4b85ac50c1e2fac080f0dd6535440891c54fcfa62cdcefedf56b1b" default)))
 '(package-selected-packages
   (quote
    (yasnippet-classic-snippets yasnippet-snippets yasnippet doom-themes go-tag counsel-projectile ag ## company-lsp flycheck lsp-ui go-mode lsp-mode counsel exec-path-from-shell projectile fzf evil-nerd-commenter general which-key linum-relative dired-sidebar use-package airline-themes powerline-evil evil-mc evil atom-one-dark-theme undo-tree nlinum-relative monokai-theme goto-chg))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




















;; (require 'powerline)
;; (powerline-default-theme)

;; (require 'evil-mc)
;; (global-evil-mc-mode  1)

;; (require 'airline-themes)
;; (load-theme 'airline-molokai)

;; (use-package dired-sidebar
;;  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
;;  :ensure t
;;  :commands (dired-sidebar-toggle-sidebar)
;;  :init
;;  (add-hook 'dired-sidebar-mode-hook
;;            (lambda ()
;;              (unless (file-remote-p default-directory)
;;                (auto-revert-mode))))
;;  :config
;;  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
;;  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

;;  (setq dired-sidebar-subtree-line-prefix "__")
;;  (setq dired-sidebar-theme 'vscode)
;;  (setq dired-sidebar-use-term-integration t)
;;  (setq dired-sidebar-use-custom-font t))
