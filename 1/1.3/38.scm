(define (cont-frac n d k)
  (define (recur i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i)
              (recur (+ i 1))))))
  (recur 1))

(define (d i)
  (if (= (remainder (+ i 1) 3) 0)
      (* (/ (+ i 1) 3) 2)
      1))

(define (approximate-e k)
  (+ 2
     (cont-frac (lambda (i) 1.0)
                d
                k)))
