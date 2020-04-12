(define (simpson f a b n)
  (define (simpson-term k)
    (cond ((or (= k 0) (= k n)) (f (+ a (* k (/ (- b a) n)))))
          ((even? k) (* 2 (f (+ a (* k (/ (- b a) n))))))
          (else (* 4 (f (+ a (* k (/ (- b a) n))))))))
  (define (simpson-next k)
    (+ k 1))
  (* (/ (/ (- b a) n) 3)
     (sum simpson-term 0 simpson-next n)))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (even? n)
  (= (remainder n 2) 0))


(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
