ORG_FILES := `find -iregex "^.*\.org$"`

tangle:
    @emacs --batch -nw -Q --eval                               \
    "(progn                                                    \
        (require 'org)                                         \
        (require 'ob)                                          \
        (require 'cl-lib)                                      \
        (setq org-babel-use-quick-and-dirty-noweb-expansion t) \
        (setq org-confirm-babel-evaluate nil)                  \
        (cl-loop for f in (split-string \"{{ORG_FILES}}\")     \
            do (org-babel-tangle-file f)))"
