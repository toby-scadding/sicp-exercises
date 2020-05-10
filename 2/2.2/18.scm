(define (reverse l)
  (let ((rest (cdr l)))
    (if (null? rest)
        l
        (append (reverse rest)
                (list (car l))))))
