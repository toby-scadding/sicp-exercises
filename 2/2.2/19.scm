(define (first-denomination l)
  (car l))

(define (except-first-denomination l)
  (cdr l))

(define (no-more? l)
  (null? l))
