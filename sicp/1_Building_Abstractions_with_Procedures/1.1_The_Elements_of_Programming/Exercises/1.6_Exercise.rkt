#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

#|
(define (square x) (* x x))

(define (average a b)
    (/ (+ a b) 2))

(define tolerance 0.00001)  

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) tolerance))

(define (improve guess x)
    (average guess (/ x guess)))

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
    (new-if (good-enough? guess x)
        guess
        (new-sqrt-iter (improve guess x)
        x)))
(define (new-sqrt x)
    (new-sqrt-iter 1.0 x))
|#

#|
    new-if - applicative order (produces out of memory). 
    It is a procedure, not a special-form and all sub-expressions are evaluated before new-if
    is applied to the values of the operands. 
    if - normal order evaluation
|#
