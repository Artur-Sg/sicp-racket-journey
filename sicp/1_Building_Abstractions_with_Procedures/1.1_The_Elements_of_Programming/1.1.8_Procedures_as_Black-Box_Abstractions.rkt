#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

(define tolerance 0.001)

(define (square x) (* x x))

(define (average a b)
    (/ (+ a b) 2))

;;1.1.8  Procedures as Black-Box Abstractions

;;Internal definitions and block structure


#|
;; The program consists of separate procedures:

(define (sqrt x)(sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
    (average guess (/ x guess)))

|#

#|
;; Block structure - nesting of definitions 

(define (sqrt x)
    (define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001))
    (define (improve guess x)
        (average guess (/ x guess)))
    (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
    (sqrt-iter 1.0 x)
)
|#

;; Now, it is not necessary to pass x explicitly to each of these procedures
;; x gets its value from the argument with which the enclosing procedure sqrt is called. This discipline is called lexical scoping
;; Lexical scoping dictates that free variables in a procedure are taken to refer to bindings made by enclosing procedure definitions;
;; Embedded definitions must come first in a procedure body. 

(define (sqrt x)
    (define (good-enough? guess)
        (< (abs (- (square guess) x)) tolerance))
    (define (improve guess)
        (average guess (/ x guess)))
    (define (sqrt-iter guess)
        (if (good-enough? guess)
            guess
            (sqrt-iter (improve guess))))
    (sqrt-iter 1.0))

(run-tests
    (test-suite "1.1.8 Procedures as Black-Box Abstractions"
        #:before (lambda () (display "1.1.8 Procedures as Black-Box Abstractions test\n"))
        (test-case "Check sqrt procedure with internal definitions and block structure"
            (check-within (list (sqrt 4) (sqrt 9) (sqrt 25)) (list 2 3 5) tolerance)
        )
    )
)
