(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* a (square x))
                 (* b x)
                 c)))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))
