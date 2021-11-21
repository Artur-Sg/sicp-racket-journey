#lang sicp

(#%require rackunit)
(#%require rackunit/text-ui)

(define (abs x)
    (cond 
        ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))
        (else '())
    )
)

(define (abs-else x)
    (cond ((< x 0) (- x))
        (else x)))

(define (>= x y)(or (> x y) (= x y)))
#|
    or alternatively as:
    (define (>= x y) (not (< x y)))
|#

(run-tests
    (test-suite "1.1.6 Conditional Expressions and Predicates"
        #:before (lambda () (display "1.1.6 Conditional Expressions and Predicates tests\n"))
        (test-case "Condition expression"
            (test-equal? "Procedure that computes the absolute value of a positive number"  (abs 4) 4)
            (test-equal? "Procedure that computes the absolute value of a negatie number" (abs -4) 4)
            (check-not-eqv? "Test wrong case for the absolute procedure of a negatie number" (abs -4) -4)
            (check-not-eqv? "Test wrong case for the absolute procedure of a positive number" (abs 4) -4)
        )
        (test-case "Condition expression with else statement"
            (test-equal? "Procedure that computes the absolute value of a positive number"  (abs-else 4) 4)
            (test-equal? "Procedure that computes the absolute value of a negatie number" (abs-else -4) 4)
            (check-not-eqv? "Test wrong case for the absolute procedure of a negatie number" (abs-else -4) -4)
            (check-not-eqv? "Test wrong case for the absolute procedure of a positive number" (abs-else 4) -4)
        )
        (test-case "Predicate to test whether one number is greater than or equal to another"
            (test-equal? "100 >= 1 is true"  (>= 100 1) #t)
            (test-equal? "1 >= 100 is false" (>= 1 100) #f)
        )
    )
)