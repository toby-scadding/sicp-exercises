(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)


(define tolerance 0.00001)

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (sqrt x)
  ((iterative-improve
     (lambda (guess) (< (abs (- (square guess) x)) tolerance))
     (lambda (guess) (average guess (/ x guess))))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve
     (lambda (guess) (< (abs (- (f guess) guess)) tolerance))
     f)
   first-guess))
