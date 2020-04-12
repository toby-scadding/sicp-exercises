(define (fast-mult a b)
  (fast-mult-iter a b 0))

(define (fast-mult-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (fast-mult-iter (double a) (halve b) c))
        (else (fast-mult-iter a (- b 1) (+ c a)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))
