(define (make-rect bottom-left top-right)
  (cons bottom-left top-right))

(define (bottom-left rect) (car rect))

(define (bottom-right rect)
  (make-point (x-point (cdr rect))
              (y-point (car rect))))

(define (top-left rect)
  (make-point (x-point (car rect))
              (y-point (cdr rect))))

(define (top-right rect) (cdr rect))

(define (width-rect rect)
  (abs (- (x-point (bottom-left rect))
          (x-point (bottom-right rect)))))

(define (height-rect rect)
  (abs (- (y-point (top-left rect))
          (y-point (bottom-left rect)))))


(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))


(define (perimeter-rect rect)
  (* 2 (+ (height-rect rect)
          (width-rect rect))))

(define (area-rect rect)
  (* (height-rect rect)
     (width-rect rect)))


; Alternative implementation of rectangle

; (define (make-rect bottom-left width height)
;   (cons bottom-left (cons width height)))

; (define (bottom-left rect) (car rect))

; (define (bottom-right rect)
;   (make-point (+ (x-point (car rect))
;                  (car (cdr rect)))
;               (y-point (car rect))))

; (define (top-left rect)
;   (make-point (x-point (car rect))
;               (+ (y-point (car rect))
;                  (cdr (cdr rect)))))

; (define (top-right rect)
;   (make-point (+ (x-point (car rect))
;                  (car (cdr rect)))
;               (+ (y-point (car rect))
;                  (cdr (cdr rect)))))
