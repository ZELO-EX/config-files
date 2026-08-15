;;; -*- lexical-binding: t -*-

(setq auto-mode-alist (cons '("\\.py\\'" . python-ts-mode) auto-mode-alist))

(defun custom-python-ts-mode-hook ()
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 4)
  (setq-local python-indent-offset 4)
  (setq-local python-indent-guess-indent-offset nil)
  (setq-local python-shell-completion-native-enable nil)
  (setq-local company-backends '((company-capf company-yasnippet)))
  (local-set-key (kbd "TAB") 'indent-for-tab-command))

(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :hook (python-ts-mode . (lambda () (lsp-deferred))))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (python-ts-mode . custom-python-ts-mode-hook)
  :init
  (setq lsp-completion-provider :capf)
  (setq lsp-completion-enable t)
  (setq lsp-disabled-clients '(pylsp))
  (setq lsp-completion-show-detail nil)
  (setq lsp-enable-symbol-highlighting t)
  (setq lsp-enable-snippet nil)
  (setq lsp-completion-enable-additional-text-edit nil))

(provide 'config-lsp-python)
