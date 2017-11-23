(require 'package)

;; TODO-questions
;; - is it possible to remove minibuf after lossing focus?
;; - how to find/replace in buffer?

; list the repositories containing them
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(package-initialize)
; fetch the list of packages available (unless package-archive-contents (package-refresh-contents))

; list the packages you want
(setq package-list '(expand-region
		     ibuffer-vc
		     which-key
		     dumb-jump
		     all-the-icons
                     all-the-icons-dired
                     ace-window
		     neotree
		     markdown-mode
		     markdown-mode+
		     evil
		     goto-chg
		     evil-nerd-commenter
		     evil-org
		     yaml-mode
		     protobuf-mode
		     magit
		     evil-magit
		     general ; for keybindings
		     helpful
		     discover-my-major
		     material-theme
		     color-theme-sanityinc-tomorrow
		     github-theme
		     kaolin-themes
		     rebecca-theme
		     ivy ; use Ivy instead of Ido
		     swiper
		     counsel
		     fzf
		     projectile
		     projectile-rails
		     counsel-projectile 
		     rg
		     robe
		     enh-ruby-mode
		     company
		     etags-select
		     rust-mode
		     racer
		     popwin))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; --- End of Melpa ---

;; Custom Emacs Variables
(set-default-font "Monaco 15" nil t)
;; (set-default-font "Fira Code 14" nil t)

;; aliases
(defalias 'yes-or-no-p 'y-or-n-p) ; y or n is enough
(defalias 'list-buffers 'ibuffer) ; always use ibuffer

(setq inhibit-splash-screen t
      initial-scratch-message nil
      icomplete-mode t
      custom-safe-themes t)

;; bind META to CMD in osx
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))

; backup settings
; TODO: enable backup
(setq make-backup-files nil ; backup a file the first time it is saved
      backup-by-copying t
      version-control t
      delete-old-versions t)

; disable scrollbars
(scroll-bar-mode 0)
(setq ring-bell-function 'ignore)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(beacon-color "#cc6666")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(fci-rule-color "#ECEFF1")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(global-ede-mode t)
 '(hl-sexp-background-color "#efebe9")
 '(nrepl-message-colors
   (quote
    ("#183691" "#969896" "#a71d5d" "#969896" "#0086b3" "#795da3" "#a71d5d" "#969896")))
 '(package-selected-packages
   (quote
    (protobuf-mode yaml-mode rebecca-theme popwin markdown-mode+ markdown-mode github-theme color-theme-sanityinc-tomorrow evil-magit magit evil-org dumb-jump evil-nerd-commenter etags-select fzf general counsel-projectile projectile-rails counsel swiper projectile helpful ivy robe company-mode discover-my-major ibuffer-vc expand-region company racer rust-mode rg evil-leader project-explorer material-theme dired-subtree evil-goggles neotree all-the-icons-dired all-the-icons ace-window enh-ruby-mode)))
 '(pdf-view-midnight-colors (quote ("#969896" . "#f8eec7")))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-syntax (quote default) nil (tramp))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#B71C1C")
     (40 . "#FF5722")
     (60 . "#FFA000")
     (80 . "#558b2f")
     (100 . "#00796b")
     (120 . "#2196f3")
     (140 . "#4527A0")
     (160 . "#B71C1C")
     (180 . "#FF5722")
     (200 . "#FFA000")
     (220 . "#558b2f")
     (240 . "#00796b")
     (260 . "#2196f3")
     (280 . "#4527A0")
     (300 . "#B71C1C")
     (320 . "#FF5722")
     (340 . "#FFA000")
     (360 . "#558b2f"))))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; End of custom-set-variables ;;

;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;; Evil
(evil-mode t)
(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))

(require 'evil-magit)

;; Ivy (instead of evil)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;(global-set-key (kbd "C-c C-r") 'ivy-resume)
;(global-set-key (kbd "<f6>") 'ivy-resume)
;(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;(global-set-key (kbd "<f1> l") 'counsel-find-library)
;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;(global-set-key (kbd "C-c g") 'counsel-git)
;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;(global-set-key (kbd "C-c k") 'counsel-ag)
;(global-set-key (kbd "C-x l") 'counsel-locate)
;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; all-the-icons
(require 'all-the-icons)

;; Neotree
(setq neo-smart-open t
      neo-theme 'nerd
      neo-window-fixed-size nil
      neo-window-width 30
      neo-window-position 'left)

(setq projectile-switch-project-action 'neotree-projectile-action)
(add-hook 'neotree-mode-hook
(lambda ()
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
    (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
    (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
    (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
    (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
    (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

    (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
    (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)

    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; Projectile
(projectile-mode)
(counsel-projectile-on)
(setq projectile-enable-caching t
      projectile-completion-system 'ivy)

;; enh-ruby-mode
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(setq enh-ruby-add-encoding-comment-on-save nil)
(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook 'robe-mode)

;; rg.el (ripgrep)
(rg-enable-default-bindings (kbd "M-s"))

;; racer
(add-hook 'rust-mode-hook #'racer-mode) (add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

;; evil org
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))

;; Bindings
(which-key-mode)

;; Company mode (for autocomplete)
(global-company-mode)
(setq company-idle-delay 0.2)
(eval-after-load 'company '(push 'company-robe company-backends))

;; Group ibuffer entries by git projects
(add-hook 'ibuffer-hook
     (lambda ()
       (ibuffer-vc-set-filter-groups-by-vc-root)
       (unless (eq ibuffer-sorting-mode 'alphabetic))))

;; Dumb Jump mode
(dumb-jump-mode)
(setq dumb-jump-default-project "~/work")
(setq dumb-jump-selector 'ivy)
(setq dumb-jump-force-searcher 'rg)

;; Markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(require 'popwin)
(popwin-mode t)

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml.j2\\'" . yaml-mode))

;; ~ Keybindings setup ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(require 'general)

;; bind a key globally in normal state; keymaps must be quoted
(setq general-default-keymaps 'evil-normal-state-map)

(setq base-leader ",")
(setq project-leader "\\")

; leader commands for working
(general-define-key :prefix base-leader
		    "t" 'other-frame
		    "n" 'neotree-toggle
		    "a" 'er/expand-region
		    "e" 'eval-last-sexp ; be fast in elisp debug :)
		    "E" 'eval-buffer
		    "r" 'rg
		    "R" 'rg-save-search
		    "L" 'rg-list-searches
		    "d" 'fzf-directory
		    "N" 'new-frame)

; leader commands for projects
(general-define-key :prefix project-leader
		    "f" 'projectile-find-file
		    "r" 'rg-project
		    "d" 'fzf-projectile 
		    "p" '(:keymap projectile-command-map :package projectile))

(general-define-key :keymaps 'global
		    "C-s" 'swiper
		    "C-x C-b" 'ibuffer ; ibuffer instead of buffer-list
		    "C-=" 'er/expand-region
		    "M-;" 'evilnc-comment-or-uncomment-lines
		    "M-g q" 'dumb-jump-quick-look
		    "M-g o" 'dumb-jump-go-other-window
		    "M-g j" 'dumb-jump-go
		    "M-g i" 'dumb-jump-go-prompt
		    "M-g x" 'dumb-jump-go-prefer-external
		    "M-g z" 'dumb-jump-go-prefer-external-other-window)


; ibuffer for ex
(evil-ex-define-cmd "ls" 'ibuffer)

;; ~ Keybindings setup ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(require 'mode-local)
(defvar-mode-local enh-ruby-mode projectile-tags-command "ripper-tags -R --exclude=node_modules --emacs")
