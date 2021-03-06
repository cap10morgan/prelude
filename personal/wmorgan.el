;; Use Solarized dark theme
(load-theme 'solarized-dark t)

;; Start server
(server-start)

;; Add rbenv rubies and shims to PATH
(setenv "PATH"
        (concat (getenv "HOME") "/.rbenv/shims:"
                (getenv "HOME") "/.rbenv/bin:"
                (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims")
                      (cons (concat (getenv "HOME") "/.rbenv/bin")
                            exec-path)))

;; Scrolling
(setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)

;; Turn on evil mode (Vim navigation FTW)
(evil-mode 1)

;; Set evil shift-width to 2
(setq evil-shift-width 2)

;; Turn on autopair-mode globally
(autopair-global-mode t)

;; Map Command-/ to comment-or-uncomment-region
(define-key global-map (kbd "s-/") 'comment-or-uncomment-region)
(define-key global-map (kbd "C-c /") 'comment-or-uncomment-region)

;; Make comment toggles operate on lines when no region is active
(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; Better auto-indenting
(define-key global-map (kbd "RET") 'comment-indent-new-line)
(electric-indent-mode)

;; Use Source Code Pro font
(set-face-attribute 'default nil :font "Source Code Pro-13")

;; Always show line numbers
(global-linum-mode 1)

;; Set JavaScript indent level to 2
(setq js-indent-level 2)

;; Activate powerline
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(setq powerline-color1 "#657b83")
(setq powerline-color2 "#839496")
(set-face-attribute 'mode-line nil
                    :foreground "#fdf6e3"
                    :background "#268bd2"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :box nil)

;; Ruby
(setq ruby-end-insert-newline nil)

;; Git gutter
(require 'git-gutter-fringe)
(setq git-gutter-fr:side 'right-fringe)
(setq-default right-fringe-width 15)
(global-git-gutter-mode t)
