#lang racket/base

(define (dob->str dobtype content)
  (string-append "<" dobtype ">" (apply string-append content) "</" dobtype ">"))

(display
  (string-append
    (dob->str
      "html"
      (list
        (dob->str "head" (list (dob->str "title" (list "hello"))))
        (dob->str "body" (list (dob->str "h1" (list "my webpage"))))))
    "\n"))
