(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (prime? n)
  (= n (smallest-divisor n)))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes min max)
  (search-for-primes-iter (odd-above min) (odd-below max)))

(define (search-for-primes-iter current max)
  (timed-prime-test current)
  (if (> current (- max 2))
      0
      (search-for-primes-iter (+ current 2) max)))

(define (odd-above n)
  (if (divides? 2 n)
      (+ n 1)
      n))

(define (odd-below n)
  (if (divides? 2 n)
      (- n 1)
      n))
