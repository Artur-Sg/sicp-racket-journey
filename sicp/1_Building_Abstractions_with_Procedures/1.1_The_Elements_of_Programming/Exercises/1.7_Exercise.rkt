#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

;; Exercise 1.7.
#|
An alternative strategy for implementing good-enough? 
is to watch how guess changes from one iteration to the next
and to stop when the change is a very small fraction of the guess.
Design a square-root procedure that uses this kind of end test. 
Does this work better for small and large numbers?

Yes, it will, because such approch reduces issue with machine tolerance comparence.
The tolerance is relatively large for small values 
and for large numbers process could stuck on yielding the same guess.
|#

(define tolerance 0.00001)  

(define (sqrt2 x)
    (define initial x)
    (define (average a b)
        (/ (+ a b) 2))
    (define (improve guess x_1)
        (average guess (/ x_1 guess)))
    (define (sqrt-iter2 prev-iter b)
        (define iter (average prev-iter b))
        ;;(if (= iter prev-iter) iter ;; exact comparence 
        (if (< (abs(- prev-iter iter)) tolerance) 
            iter
            (sqrt-iter2 (improve iter initial) prev-iter)))
    (sqrt-iter2 1.0 x))


(run-tests
    (test-suite "Exercise 1.7"
        #:before (lambda () (display "Exercise 1.7 test\n"))
        (test-case "Check list of second variant of sqrt procedures
                    where we watch how guess changes from one iteration 
                    to the next and to stop when the change is a very small fraction of the guess."
                (check-within (list (sqrt2 4) (sqrt2 9) (sqrt2 25) (sqrt2 10000000000000)) (list 2 3 5 3162277.66017) tolerance)
                )
        )
)