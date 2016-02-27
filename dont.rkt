#lang racket/base

(struct dob (type content))  ; content is a list of dobs and/or strings.

(define (dob->str dob)
  (if (string? dob)
    dob
    (let* ([tag (dob-type dob)]
           [content (dob-content dob)])
      (string-append "<" tag ">" (apply string-append (map dob->str content)) "</" tag ">"))))

(display
  (string-append
    (dob->str
      (dob "html" (list
                    (dob "head" (list (dob "title" (list "hello"))))
                    (dob "body" (list (dob "h1" (list "my webpage")))))))
    "\n"))
