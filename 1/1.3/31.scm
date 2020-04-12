(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

(define (identity n) n)

(define (inc n) (+ n 1))


(define (pi-product n)
  (define (pi-term k)
    (/ (* (* 2 k)
          (* 2 (+ k 1)))
       (square (+ (* 2 k)
                  1))))
  (product pi-term 1.0 inc n))

(define (square n)
  (* n n))


(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (fact-iter n)
  (product-iter identity 1 inc n))
