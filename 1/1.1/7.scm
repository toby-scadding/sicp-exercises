(define (sqrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (good-enough? guess previous-guess)
  (< (/ (abs (- guess previous-guess)) guess) 0.001))

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))


(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))
