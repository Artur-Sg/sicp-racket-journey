#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

#|
    Newton's method of successive approximations
    Compute examplew of square root of 2 (start from the 1):
    1, 2/1 = 2, (2 + 1) / 2 = 1,5
    1.5, 2/1.5 = 1.3333, (1.3333 + 1.5) / 2 = 1,4167
|#

(define (square x) (* x x))

(define tolerance 0.00001)  
(define (good-enough? guess x)
    (< (abs (- (square guess) x)) tolerance))

(define (average a b)
    (/ (+ a b) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (sqrt-iter guess x)
    (if (good-enough? guess x) guess
        (sqrt-iter (improve guess x)
        x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))

#|
;; variant with inner declared procedures (no need to pass second argument)
(define (sqrt x)
    (define (good-enough? guess)
        (< (abs (- (square guess) x)) 0.001)
        )
    (define (improve guess)
        (average guess (/ x guess))
        )
    (define (average a b)
        (/ (+ a b) 2)
        )
    (define (sqrt-iter guess)
        (if (good-enough? guess) guess
            (sqrt-iter (improve guess)))
        )(sqrt-iter 1.0))
|#

(run-tests
    (test-suite "1.1.7 Example: Square Roots by Newton's Method"
        #:before (lambda () (display "1.1.7  Example: Square Roots by Newton's Method tests\n"))
        (test-case "Check list of sqrt procedures"
            (check-within (list (sqrt 4) (sqrt 9) (sqrt 25)) (list 2 3 5) tolerance)
            )
        )
)