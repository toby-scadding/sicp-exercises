(define (even? x)
  (= (remainder x 2) 0))

(define (same-parity x . l)
  (let ((modifier (if (even? x) 0 1)))
    (define (iter result rest)
      (if (null? rest)
          result
          (if (even? (+ (car rest) modifier))
              (iter (append result
                            (list (car rest)))
                    (cdr rest))
              (iter result
                    (cdr rest)))))
    (iter (list x) l)))
