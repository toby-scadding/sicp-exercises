(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a)
                              (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else (combiner null-value
                        (filtered-accumulate combiner null-value term (next a) next b filter)))))

(define (sum-prime-squares a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (square n) (* n n))

(define (inc n) (+ n 1))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


(define (product-coprime n)
  (define (coprime-filter i)
    (= (gcd n i) 1))
  (filtered-accumulate * 1 identity 1 inc (- n 1) coprime-filter))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity n) n)
