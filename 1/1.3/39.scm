(define (cont-frac n d k)
  (define (recur i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i)
              (recur (+ i 1))))))
  (recur 1))

(define (tan-cf x k)
  (let ((y (- (* x x))))
    (define (n i)
      (if (= i 1)
          x
          y))
    (cont-frac n
              (lambda (i) (- (* 2.0 i) 1.0))
              k)))
