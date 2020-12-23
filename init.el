;; ----------------------------- Mini Cheatsheet -------------------------------

;; -- Movimiento de cursor --

;; C-m - Return (Enter)

;; C-p - (P)revious row 
;; C-n - (N)ext row
;; C-b - previous col (go (B)ackwards)
;; C-f - next col (go (F)orward)

;; -- Manejo del portapapeles --

;; C-w - Kill region (Cortar)
;; M-w - Kill ring save (Copiar)
;; C-y - Yank (Pegar)
;; M-y - Kill-ring yank pop (Recorrer portapapeles)

;; -- Historial de cambios --

;; C-x u - Undo/Redo
;; Paquete útil: undo-tree

;; -- Macros --

;; F3 - Grabar Macro
;; F4 - Guardar y ejecutar Macro

;; M-x name-last-kbd-macro
;; - Establecer un nombre para la útimaMacro

;; M-x insert-kbd-macro - Insertar código de una macro
;; Ej.

;;(global-set-key
;; (kbd "C-c l")
;; (fset 'comment-lisp
;;       (kmacro-lambda-form [?\; ?\; down home] 0 "%d")))

;; -- Misceláneo --

;; C-u NUM COMMAND - Repetir COMMAND NUM veces
;; C-x z [z ...] - Repetir el último comando


;; -------------------------- Movimiento de ventana ------------------------------

(when (fboundp 'windmove-default-keybindings)
  (global-set-key (kbd "S-<left>")  'windmove-left)
  (global-set-key (kbd "S-<right>") 'windmove-right)
  (global-set-key (kbd "S-<up>")    'windmove-up)
  (global-set-key (kbd "S-<down>")  'windmove-down))


;; ----------------------------- Atajos de teclado -------------------------------

;; Vincular 'C-z' a 'solo deshacer'
(global-set-key (kbd "C-z")  'undo-only)
;;; La casa es verde

;; --------------------------------- Paquetería ----------------------------------

(require 'package)
(package-initialize)

;; Repositiorios de paquetes
(setq package-archives '(("elpa" . "http://elpa.gnu.org/packages/")
;;                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; Instalación de use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Muestra los posibles atajos
(use-package which-key
  :ensure t
  :init (which-key-mode))

;; Aumenta la productividad para mover el cursor
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))


;; ----------------------------- Mejoras de aspecto ------------------------------

;; Eliminar algunos elementos gráficos
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Cambiar el buffer de bienvenida
(use-package dashboard
  :ensure t
  :init (dashboard-setup-startup-hook))

;; Mostrar números de línea
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;;(setq display-line-numbers-type 'relative)

;; Variables generadas a través de Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#a1efe4" "#fcfcfa"])
 '(ansi-term-color-vector
   [unspecified "#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#a1efe4" "#fcfcfa"])
 '(column-number-mode t)
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes
   '("2dff5f0b44a9e6c8644b2159414af72261e38686072e063aa66ee98a2faecf0e" "5846b39f2171d620c45ee31409350c1ccaddebd3f88ac19894ae15db9ef23035" default))
 '(package-selected-packages '(avy dashboard dracula-theme monokai-pro-theme 2048-game)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
