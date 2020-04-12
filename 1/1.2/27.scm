(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (fools-fermat? n)
  (fermat-test-iter 1 n))

(define (fermat-test-iter a n)
  (cond ((> (square a) n) true)
        ((= (expmod a n n) a) (fermat-test-iter (+ a 1) n))
        (else false)))

(define (square n)
  (* n n))
