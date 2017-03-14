;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;;(require 'htmlize)


;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
;;关闭自动生成配置文件
(setq make-backup-files nil)
;;关闭自动保存文件
(setq auto-save-default nil)
;;自动加载外部被修改的文件
(global-auto-revert-mode 1)
;; 显示行号
(global-linum-mode 1)
;;选中删除
(delete-selection-mode 1)
;;全局补全模式
(global-company-mode 1)
;;忽略该死的bell生
(setq ring-bell-function 'ignore)

;; 关闭启动帮助画面
;;(setq inhibit-splash-screen 1)

;; 不知道为什么加了这个，在打开有中文字符的文件就卡得不行
;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;;(set-face-attribute 'default nil :height 160)
;; UTF-8 as default encoding
;;(set-language-environment "UTF-8")


;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)
;;新曾F1/F3绑定
(global-set-key [f1] (quote org-export-dispatch))
(global-set-key [f3] (quote org-publish-project))
(global-set-key [f4] (quote org-md-export-to-markdown))
;; 自动换行
(global-set-key [f5] 'toggle-truncate-lines)

;;括号对应
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;高亮当前行
(global-hl-line-mode 1)
;;pdflatex,暂时不支持中文
(setq latex-run-command "pdflatex")


;;publish到html文件
(require 'ox-publish)
(setq org-publish-project-alist
      '(
	("blog-notes"
 :base-directory "~/org/notes"
 :base-extension "org"
 :publishing-directory "~/org/public_html/"
 :recursive t
 :publishing-function org-html-publish-to-html
 :headline-levels 4             ; Just the default for this project.
 :auto-preamble t
 :htmlized-source t
 :section-numbers nil
 :author "jing_zhu#me.com"
 :email "jing_zhu@me.com"
 :auto-sitemap t                ; Generate sitemap.org automagically...
 :sitemap-filename "index.org"  ; ... call it sitemap.org (it's the default)...
 :sitemap-title "小土鳖的杂货铺"         ; ... with title 'Sitemap'.
 :sitemap-sort-files anti-chronologically
 :sitemap-file-entry-format "%d %t"
 :timestamp nil

)

("blog-static"
 :base-directory "~/org/notes"
 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
 :publishing-directory "~/org/public_html/"
 :recursive t
 :publishing-function org-publish-attachment
)
(
 "blog" :components ("blog-notes" "blog-static")
)
       )
)

;;(setq org-html-validation-link nil) ; 去掉validation显示
(setq org-html-link-home "../index.html"); 设置home超链接
(setq org-html-link-up "../index.html")
;;pdf
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("c:/texlive/2016/bin/win32/xelatex  -shell-escape -interaction nonstopmode -output-directory %o %f"
        "c:/texlive/2016/bin/win32/xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "c:/texlive/2016/bin/win32/xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (htmlize org company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
