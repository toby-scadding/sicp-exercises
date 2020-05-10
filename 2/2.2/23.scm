(define (for-each proc items)
  (if (null? items)
      true
      (let ((output (proc (car items))))
        (for-each proc (cdr items)))))
