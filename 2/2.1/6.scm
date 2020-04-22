(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one
  (lambda (f) (lambda (x) (f x)))) ; or (lambda (f) f)

(define two
  (lambda (f) (lambda (x) (f (f x)))))


(define (+ n m)
  (lambda (f) (lambda (x) ((n f) ((m f) x)))))
