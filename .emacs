(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(setq package-list '(which-key
		     dumb-jump
		     general ; for keybindings
		     neotree
		     markdown-mode
		     markdown-mode+
		     evil
		     evil-nerd-commenter
		     evil-org
		     yaml-mode
		     protobuf-mode
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
		     enh-ruby-mode
		     company
		     slim-mode
		     sass-mode
		     alchemist
		     smart-tabs-mode))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; --- End of Melpa ---

;; Custom Emacs Variables
(set-default-font "Monaco 14" nil t)

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
(setq backup-directory-alist '(("." . "~/.emacs-backup"))
      make-backup-files t ; backup a file the first time it is saved
      backup-by-copying t
      version-control t
      delete-old-versions t)

; smart tab
(autoload 'smart-tabs-mode "smart-tabs-mode"
  "Intelligently indent with tabs, align with spaces!")
(autoload 'smart-tabs-mode-enable "smart-tabs-mode")
(autoload 'smart-tabs-advice "smart-tabs-mode")
(autoload 'smart-tabs-insinuate "smart-tabs-mode")

(smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'python
		      'ruby 'nxml)

(setq ring-bell-function 'ignore)

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

;; Neotree
(setq neo-smart-open t
      neo-theme 'nerd
      neo-window-fixed-size nil
      neo-window-width 30
      neo-window-position 'left)

;; Projectile
(projectile-mode)

;; enh-ruby-mode
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist
	     '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(setq enh-ruby-add-encoding-comment-on-save nil)
(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook 'robe-mode)

;; simplier indent for ruby
(setq ruby-deep-indent-paren nil)

;; rg.el (ripgrep)
(rg-enable-default-bindings (kbd "M-s"))

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

;; Yaml mode
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml.j2\\'" . yaml-mode))

;; fix all whitespace problems
(add-hook 'before-save-hook 'whitespace-cleanup)

(setq base-leader ",")
(setq project-leader "\\")

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/orgs/dev.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
