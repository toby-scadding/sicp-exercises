(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car x)
  (divisor-power x 2))

(define (cdr x)
  (divisor-power x 3))

(define (divisor-power n d)
  (define (iter n result)
    (if (divides? n d)
        (iter (/ n d) (+ result 1))
        result))
  (iter n 0))

(define (divides? n d)
  (= (remainder n d)
     0))
