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
The default if statement is a special form only evaluates one of parameters 
- not both even when an interpreter follows applicative substitution
New-if doesn't have this property. It never stops calling itself due 
to the third parameter passed to it in sqrt-iter.
Re-defining a special form using generic arguments eventually overflows 
the stack causing an out of memory error.|#
