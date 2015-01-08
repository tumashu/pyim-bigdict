;;; chinese-pyim-bigdict.el --- A big pinyin dict for Chinese-pyim

;; Copyright 2014 Feng Shu
;;
;; Author: Feng Shu <tumashu@gmail.com>
;; URL: https://github.com/tumashu/chinese-pyim
;; Package-Requires: ((cl-lib "0.5"))
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:
;; 这是一个 Chinese-pyim 拼音词库文件，词量大约100万，词库大于20M。
;; 仅供个人使用，主要用于测试 Chinese-pyim 添加大词库后的表现。

;;; Code:
(require 'cl-lib)

(defconst pyim-bigdict-name "BigDict001")

(defun pyim-dict-available-p (dictname)
  (cl-some (lambda (x)
             (let ((name (plist-get x :name)))
               (string= name dictname)))
           pyim-dicts))

(defun chinese-pyim-bigdict-enable ()
  (interactive)
  (let ((dict-file (concat (file-name-directory
                            (locate-library "chinese-pyim-bigdict.el")) "pyim-bigdict.txt")))
    (when (and (file-exists-p dict-file)
               (not (pyim-dict-available-p pyim-bigdict-name)))
      (add-to-list 'pyim-dicts
                   `(:name ,pyim-bigdict-name
                           :file ,dict-file
                           :coding utf-8-unix))
      (message "添加Chinese-pyim输入法词库: (%s)，重启 emacs 后生效！" pyim-bigdict-name))))

(provide 'chinese-pyim-bigdict)

;; Local Variables:
;; coding: utf-8-unix
;; End:

;;; chinese-pyim-bigdict.el ends here
