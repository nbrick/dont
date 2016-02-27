#lang racket/base

(define (h1 content)
  (string-append "<h1>" content "</h1>"))

(display (string-append (h1 "hello") "\n"))
