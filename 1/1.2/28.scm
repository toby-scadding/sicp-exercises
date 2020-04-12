(define (expmod base exp m)
  (define (square-with-check x)
    (define (check x square)
      (if (and (= square 1)
               (not (= x 1))
               (not (= x (- m 1))))
          0
          square))
    (check x (remainder (square x) m)))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square-with-check (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (fools-fermat? n)
  (fermat-test-iter 1 n))

(define (fermat-test-iter a n)
  (cond ((> (square a) n) true)
        ((= (expmod a (- n 1) n) 0) false)
        ((= (expmod a (- n 1) n) 1) (fermat-test-iter (+ a 1) n))
        (else false)))

(define (square n)
  (* n n))
