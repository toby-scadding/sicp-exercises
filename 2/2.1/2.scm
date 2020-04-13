(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment seg) (car seg))

(define (end-segment seg) (cdr seg))


(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))


(define (midpoint-segment seg)
  (average-points (start-segment seg)
                  (end-segment seg)))

(define (average-points a b)
  (make-point (average (x-point a)
                       (x-point b))
              (average (y-point a)
                       (y-point b))))

(define (average x y) (/ (+ x y) 2))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
