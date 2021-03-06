(define (mul-interval x y)
  (let ((xl (lower-bound x))
        (xu (upper-bound x))
        (yl (lower-bound y))
        (yu (upper-bound y)))
    (cond ((<= xu 0)
           (cond ((<= yu 0) (make-interval (* xu yu) (* xl yl)))
                 ((>= yl 0) (make-interval (* xl yu) (* xu yl)))
                 (else (make-interval (* xl yu) (* xl yl)))))
          ((>= xl 0)
           (cond ((<= yu 0) (make-interval (* xu yl) (* xl yu)))
                 ((>= yl 0) (make-interval (* xl yl) (* xu yu)))
                 (else (make-interval (* xu yl) (* xu yu)))))
          (else
           (cond ((<= yu 0) (make-interval (* xu yl) (* xl yl)))
                 ((>= yl 0) (make-interval (* xl yu) (* xu yu)))
                 (else (make-interval (min (* xl yu)
                                           (* xu yl))
                                      (max (* xl yl)
                                           (* xu yu)))))))))
