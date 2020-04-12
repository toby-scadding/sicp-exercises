(define (cont-frac n d k)
  (define (recur i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i)
              (recur (+ i 1))))))
  (recur 1))


(define (cont-frac-iter n d k)
  (define (iter n d i tail)
    (if (= i 0)
        tail
        (iter n
              d
              (- i 1)
              (/ (n i)
                 (+ (d i) tail)))))
  (iter n d k 0))


(define (test k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))
