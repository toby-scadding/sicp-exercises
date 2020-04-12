(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display next)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f
               (repeated f (- n 1)))))


(define (sqrt x)
  (fixed-point-of-transform
    (lambda (y) (/ x y)) average-damp 1.0))

(define (cbrt x)
  (fixed-point-of-transform
    (lambda (y) (/ x (expt y 2))) average-damp 1.0))

; For testing
; (define (nth-root x n num-damps)
;   (fixed-point-of-transform
;     (lambda (y) (/ x (expt y (- n 1)))) (repeated average-damp num-damps) 1.0))

(define (nth-root x n)
  (fixed-point-of-transform
    (lambda (y) (/ x (expt y (- n 1))))
    (repeated average-damp (floor (/ (log n)
                                     (log 2))))
    1.0))
