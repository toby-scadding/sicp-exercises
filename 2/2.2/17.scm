; (define (last-pair l)
;   (list
;     (list-ref l
;               (- (length l) 1))))

(define (last-pair l)
  (let ((rest (cdr l)))
    (if (null? rest)
        l
        (last-pair rest))))
