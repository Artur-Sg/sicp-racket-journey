#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

(define tolerance 0.00001)  

(define (square s) (* s s))

#|
    Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, 
    then a better approximation is given by the value (x/y^2 + 2y)/3
|#

#| First variant (compare guess value with original considering tolerance)

(define (cube c) (* c c c))

(define (cbcrt-good-enough? guess x)
    (< (abs(- (cube guess) x)) tolerance))

(define (improve-cbcrt x y)(/ (+ (/ x (square y)) (* 2 y)) 3))

(define (cbcrt-iter guess x)
    (if (cbcrt-good-enough? guess x)
        guess
        (cbcrt-iter (improve-cbcrt x guess) x
                    )))

(define (cbcrt x)
    (cbcrt-iter 1.0 x))
|#

;; Second variant (compare guess value with previous guess (commented line with tolerance considering))

(define (cbcrt x)
    (define (improve x_1 guess)(/ (+ (/ x_1 (square guess)) (* 2 guess)) 3))
    (define (cbcrt-iter guess x_2)
        (define iter (improve x_2 guess))
        (if (= guess iter)
            guess
            (cbcrt-iter iter x_2)
        )
    )
    (cbcrt-iter 1.0 x)
)

(run-tests
    (test-suite "Exercise 1.8"
        #:before (lambda () (display "Exercise 1.8 test\n"))
        (test-case "Test list for Newton's method for cube roots"
            (check-within (list (cbcrt 0.000027) (cbcrt 8) (cbcrt 27) (cbcrt 64) (cbcrt 1000000000)) (list 0.03 2 3 4 1000) tolerance))
        )
)